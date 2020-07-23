class ArticlesController < ApplicationController
  #define a method
  def new

  end

  def create
    render plain: params[:article].inspect
  end
end
