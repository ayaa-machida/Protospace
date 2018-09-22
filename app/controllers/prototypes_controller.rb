class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.page(params[:page]).per(8).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def destroy
      prototype = Prototype.find(params[:id])
      if prototype.user_id == current_user.id
        prototype.destroy
      end
    end

    def edit
      @prototype = Prototype.find(params[:id])
    end

   def update
      @prototype = Prototype.find(params[:id])
      if prototypes.user_id == current_user.id
        prototype.update(prototype_params)
      end
    end
  # def update
  #   @prototype = Prototype.find_by(id: params[:id])
  #   @prototype.content = params[:content]
  #   @prototype.save
  #   redirect_to("/")
  # end



  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy if prototype.user_id == current_user.id
    redirect_to root_path, notice: 'Prototype was successfully deleted.'
  end

  def update
    @prototype.update(prototype_params)
    redirect_to root_path, notice: 'Prototype was successfully updated.'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :content,
      :user_id,
      captured_images_attributes: [:id, :content, :status]
    )
  end
end
