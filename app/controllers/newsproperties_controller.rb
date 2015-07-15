class NewspropertiesController < ApplicationController

  def index
    @newsproperty=NewsProperty.last rescue nil

    render layout: 'admin_layout'
  end

  def edit
    @newsproperty=NewsProperty.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @newsproperty=NewsProperty.find(params[:id])
    if @newsproperty.update(params_newsproperty)
      flash[:notice] = "News Properties updated successfully."
      redirect_to newsproperties_path
    else
      flash[:alert] = "Please choose logo in these file format (jpg, jpeg, gif, png)."
      redirect_to newsproperties_path
    end
  end

  private
  def params_newsproperty
    params.require(:news_property).permit(:name,:address,:phone,:email,:logo,:febicon)
  end

end
