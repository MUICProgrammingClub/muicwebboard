class MajorsController < ApplicationController
  def index
    @majors = Major.all
  end

  def show
    @major = Major.find(params[:id])
    @users = @major.users
  end
end
