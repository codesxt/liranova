class PublicationsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    @publications = Publication.paginate(page: params[:page])
  end
  
  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end
  
  def create
    @publication = current_user.publications.build(publication_params)
    if @publication.save
      flash[:success] = "¡Publicación creada!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
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
    random_id = 1 + Random.rand(Publication.count)
    @publication = Publication.find(random_id)
    render 'show'
  end
  
  private

    def publication_params
      params.require(:publication).permit(:title, :content)
    end

    def correct_user
      @publication = current_user.publications.find_by(id: params[:id])
      redirect_to root_url if @publication.nil?
    end
end