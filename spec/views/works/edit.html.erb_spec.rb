require 'rails_helper'

RSpec.describe "works/edit", type: :view do
  before(:each) do
    @work = assign(:work, Work.create!(
      :category => "MyText",
      :type => "MyText",
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders the edit work form" do
    render

    assert_select "form[action=?][method=?]", work_path(@work), "post" do

      assert_select "textarea#work_category[name=?]", "work[category]"

      assert_select "textarea#work_type[name=?]", "work[type]"

      assert_select "textarea#work_content[name=?]", "work[content]"

      assert_select "input#work_user_id[name=?]", "work[user_id]"
    end
  end
end
