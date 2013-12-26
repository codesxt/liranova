class PublicationsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    @publications = Publication.paginate(page: params[:page]).where("status" => true)
  end
  
  def show
    @publication = Publication.find(params[:id])
    @comments = @publication.comments.all
    @new_comment = Comment.new
  end

  def new
    @publication = Publication.new
  end
  
  def create
    @publication = current_user.publications.build(publication_params)
    if @publication.save
      flash[:success] = "¡Publicación actualizada!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def update
    @publication = Publication.find_by_id(params[:id])
    if @publication.update_attributes(publication_params)
      flash[:success] = "¡Publicación actualizada!"
      redirect_to @publication
    else
      redirect_to @publication
    end
  end

  def destroy
    @publication.destroy
    redirect_to root_url
  end
  
  def show_random
    #Esto se tiene que mejorar, porque no cubre el caso en que
    #alguna publicación entre 1 y random_id que haya sido eliminada
    #sea seleccionada
    publication_ids = Publication.select("id")
    size = publication_ids.size
    random_id = 1 + Random.rand(size)
    @publication = Publication.find(random_id)
    @comments = @publication.comments.all
    @new_comment = Comment.new
    render 'show'
  end

  def show_drafts
    @publications = Publication.paginate(page: params[:page]).where("status" => false, "user_id" => current_user)
  end
  
  private

    def publication_params
      params.require(:publication).permit(:title, :content, :status)
    end

    def correct_user
      @publication = current_user.publications.find_by(id: params[:id])
      redirect_to root_url if @publication.nil?
    end
end
