class AdminsController < ApplicationController
  def index
    @categories=Category.all
     render layout: 'admin_layout'
  end
end
