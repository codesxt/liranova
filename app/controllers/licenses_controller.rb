class LicensesController < ApplicationController
  #before_action :signed_in_user, only: [:index]
  before_action :admin_user,     only: [:create, :edit, :update, :destroy]

  def index
    @licenses = License.paginate(page: params[:page])
  end
  
  def show
    @license = License.find(params[:id])
  end
  
  def new
	@license = License.new
  end
  
  def create
    @license = License.new(license_params)
    if @license.save
      flash[:success] = "¡Licencia añadida!"
      redirect_to @license
    else
      render 'new'
    end
  end
  
  def edit
    @license = License.find(params[:id])
  end

  def update
    @license = License.find(params[:id])
    if @license.update_attributes(license_params)
      flash[:success] = "Licencia actualizada"
      redirect_to @license
    else
      render 'edit'
    end
  end
  
  def destroy
    License.find(params[:id]).destroy
    flash[:success] = "Licencia destruida."
    redirect_to licenses_url
  end

  private

    def license_params
      params.require(:license).permit(:name, :description)
    end

    # Before filters
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
