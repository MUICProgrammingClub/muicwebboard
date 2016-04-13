require 'rails_helper'

RSpec.describe "lectures/edit", type: :view do
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      :user => nil,
      :course => nil,
      :instructor => nil,
      :term => nil,
      :lecture_name => "MyText",
      :chapter => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit lecture form" do
    render

    assert_select "form[action=?][method=?]", lecture_path(@lecture), "post" do

      assert_select "input#lecture_user_id[name=?]", "lecture[user_id]"

      assert_select "input#lecture_course_id[name=?]", "lecture[course_id]"

      assert_select "input#lecture_instructor_id[name=?]", "lecture[instructor_id]"

      assert_select "input#lecture_term_id[name=?]", "lecture[term_id]"

      assert_select "textarea#lecture_lecture_name[name=?]", "lecture[lecture_name]"

      assert_select "textarea#lecture_chapter[name=?]", "lecture[chapter]"

      assert_select "textarea#lecture_description[name=?]", "lecture[description]"
    end
  end
end
