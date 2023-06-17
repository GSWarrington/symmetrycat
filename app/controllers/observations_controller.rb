class ObservationsController < ApplicationController
  def index
    @observations = Observation.paginate(page: params[:page])
  end

  def show
    @observation = Observation.find(params[:id])
  end
  
  def new
    @observation = Observation.new
  end

  def help
  end

  def create
    # oooh, has to be done before assigning @observation...
    # https://stackoverflow.com/questions/75870600/rails-active-storage-how-to-change-main-image-size
    path = params[:observation][:pic].tempfile.path
    vips_image = ImageProcessing::Vips.source(path).resize_to_limit(1024, 1024).saver(strip: true, quality: 100).convert("jpg").call
    params[:observation][:pic].tempfile = vips_image
    @observation = current_user.observations.build(observation_params)

    if @observation.save
      # path = params[:observation][:pic].path
      # image = ImageProcessing::Vips.source(path)
      # result = image.resize_to_limit!(1024, 1024)
      # @observation.pic.attach(result)
      # @observation.save
      redirect_to @observation
    else
      render :new
    end
  end

  def edit
    @observation = Observation.find(params[:id])
  end

  def update
    # TODO: This needs to be fixed for if someone updates image
    # path = params[:observation][:pic].tempfile.path
    # vips_image = ImageProcessing::Vips.source(path).resize_to_limit(1024, 1024).saver(strip: true, quality: 100).convert("jpg").call
    # params[:observation][:pic].tempfile = vips_image
    @observation = Observation.find(params[:id])
    # strip_exif_from_attachment_params(@observation, observation_params)

    @observation.rotations = params[:rotations]
    @observation.reflections = params[:reflections]
    @observation.translations = params[:translations]
    @observation.glides = params[:glides]
    if @observation.update(observation_params)
      redirect_to @observation
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def classify
    @observation = Observation.find(params[:id])
  end

  # def classifyupdate
  #   @observation = Observation.find(params[:id])

  #   @observation.rotations = "blah"
  #   if @observation.update(observation_params)
  #     redirect_to @observation
  #   else
  #     render :classify, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy

    redirect_to root_path, status: :see_other
  end

  # Modified from https://angelos.dev/2021/03/strip-exif-metadata-from-images-in-rails/
  private def strip_exif_from_attachment_params(record, record_params)
    record.attachment_reflections.each_key do |attachment_attribute|
      Array(record_params[attachment_attribute]).each do |file_param|
        next if file_param.content_type != 'image/jpeg'

        uploaded_file = file_param.tempfile
        image = MiniMagick::Image.read(uploaded_file)
        image.auto_orient # Before stripping
        image.strip # Strip Exif
        uploaded_file.rewind
        image.write(uploaded_file)
      end
    end
  end

  private
  def observation_params
    params.require(:observation).permit(:pic,:address,:city,:state,:country,:street,:notes,:date,:time,:rotations,:reflections,:translations,:glides,:group,:virtual,:dimension)
  end

end
