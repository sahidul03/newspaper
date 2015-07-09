class HeadlinesController < ApplicationController

  def index
    @categories=Category.all
    @headlines=Headline.all
    render layout: 'admin_layout'
  end

end
