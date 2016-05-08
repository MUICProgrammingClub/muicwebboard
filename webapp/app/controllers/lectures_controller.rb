class LecturesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, :set_lecture, only: [:show, :edit, :update, :destroy]

  # GET /lectures
  # GET /lectures.json
  def index
    Lecture.reindex
    if current_user.nil?
      redirect_to user_session_path
    else
      @user_role = UserRole.find(current_user)
    end
    if params[:q].present? 
      @lectures = Lecture.search params[:q], where:{approve: true}, page: params[:page], per_page: 30
    else
      @lectures = Lecture.search "*", where:{approve: true}, field: [:lecture_name, :chapter, :course_name, :instructor_name], page: params[:page], per_page: 30
    end

    @lectures_admin = Lecture.search "*", where:{approve: [nil, false]}, page: params[:page], per_page: 20
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @review = Review.new(user_id: current_user.id, lecture_id: @lecture.id)
  end
  # GET /lectures/new
  def new
    @lecture = Lecture.new

  end

  # GET /lectures/1/edit
  def edit
  end

  def edit_review
    redirect_to lecture_path(:edited => (params[:edited] == '1'))
  end

  def approved
    @lecture = Lecture.find(params[:id])
    @lecture.approve = true
    @lecture.save
    @lectures = Lecture.all
    redirect_to lectures_path
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user = current_user
    respond_to do |format|
      if @lecture.save
        if !params[:lecture_files].nil?
          params[:lecture_files].each {|file| 
            @lecture.lecture_files.create(image: file, user_id: current_user.id)
          }
        end
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        if !params[:lecture_files].nil?
          params[:lecture_files].each {|file| 
            @lecture.lecture_files.create(image: file, user_id: current_user.id)
          }
        end
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    LectureFile.destroy_all(id: @lecture.lecture_files)
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:user_id, :course_id, :instructor_id, :term_id, :lecture_name, :chapter, :description, :file, :approve)
    end
end
