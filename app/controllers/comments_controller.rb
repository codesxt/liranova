class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    @comments = Comment.paginate(page: params[:page])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "¡Comentario creado!"
      redirect_to publication_path(Publication.find(@comment.publication_id))
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def update
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  def edit
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :publication_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
