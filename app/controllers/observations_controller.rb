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
    @observation = current_user.observations.build(observation_params)

    if @observation.save
      redirect_to @observation
    else
      render :new
    end
  end

  def edit
    @observation = Observation.find(params[:id])
  end

  def update
    @observation = Observation.find(params[:id])

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

  private
  def observation_params
    params.require(:observation).permit(:title,:pic,:address,:city,:state,:country,:street,:description,:date,:time,:rotations,:reflections,:translations,:glides,:group)
  end

end
