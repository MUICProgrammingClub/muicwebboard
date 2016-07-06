class StaticPagesController < ApplicationController
  def index
  end

  def show
  	if params[:q].present? 
      @lectures = Lecture.search params[:q], where:{approve: true}, page: params[:page], per_page: 5
      @courses = Course.search params[:q], page: params[:page], per_page: 5
    else
      @lectures = Lecture.search '*',where:{approve: true}, page: params[:page], per_page: 5
      @courses = Course.search '*', page: params[:page], per_page: 5
  	end
  end

end
