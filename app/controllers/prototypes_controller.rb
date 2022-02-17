class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :not_log_in_hajikitai, only: [:edit, :update, :destroy]
  before_action :syousai_prototype, except: [:index, :new, :create]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @user = User.new
    @user = @prototype.user 
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @user = User.new
    @user = @prototype.user
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def syousai_prototype
    @prototype = Prototype.find(params[:id])
  end

  def not_log_in_hajikitai
    @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end
end