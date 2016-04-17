class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.lecture, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review.lecture }
      else
        @lecture = @review.lecture
        format.html { render 'lecture/show' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @review.lecture, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:lecture_id, :user_id, :content, :rating)
    end
end
