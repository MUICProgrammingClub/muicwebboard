class CoursesController < ApplicationController
  def index
    filter = params[:filter]
    @courses = filter=="with_lecture" ? Course.joins(:lectures).uniq.all : Course.all
    #@courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lectures = @course.lectures
  end

end
