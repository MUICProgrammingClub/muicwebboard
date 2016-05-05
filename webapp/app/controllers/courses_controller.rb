class CoursesController < ApplicationController
  def index
    filter = params[:filter]
    @courses = filter=="with_lecture" ? Course.joins(:lectures).uniq.all.paginate(:page => params[:page], :per_page => 20) : Course.all.paginate(:page => params[:page], :per_page => 20)
    #@courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lectures = @course.lectures
  end

end
