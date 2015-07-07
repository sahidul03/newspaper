class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  def index
     render layout: 'user_layout'
  end


end
