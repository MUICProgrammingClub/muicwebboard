class LecturesController < ApplicationController
  before_action :authenticate_user!, :set_lecture, only: [:show, :edit, :update, :destroy]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new

  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user = current_user
    respond_to do |format|
      if @lecture.save
        if params[:lecture_files]
          params[:lecture_files].each {
            |image| @lecture.lecture_files.create(image: image, user_id: current_user.id)
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
        if params[:lecture_files]
          params[:lecture_files].each {
            |image| @lecture.lecture_files.create(image: image, user_id: current_user.id)
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
      params.require(:lecture).permit(:user_id, :course_id, :instructor_id, :term_id, :lecture_name, :chapter, :description, :file)
    end
end
