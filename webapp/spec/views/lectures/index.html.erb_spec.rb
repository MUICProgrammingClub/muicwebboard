require 'rails_helper'

RSpec.describe "lectures/index", type: :view do
  before(:each) do
    assign(:lectures, [
      Lecture.create!(
        :user => nil,
        :course => nil,
        :instructor => nil,
        :term => nil,
        :lecture_name => "MyText",
        :chapter => "MyText",
        :description => "MyText"
      ),
      Lecture.create!(
        :user => nil,
        :course => nil,
        :instructor => nil,
        :term => nil,
        :lecture_name => "MyText",
        :chapter => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of lectures" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
