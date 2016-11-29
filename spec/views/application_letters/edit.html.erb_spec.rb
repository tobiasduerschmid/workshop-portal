require 'rails_helper'

RSpec.describe "application_letters/edit", type: :view do
  before(:each) do
    @application_letter = assign(:application_letter, FactoryGirl.create(:application_letter))
  end

  it "renders the edit application form" do
    render

    assert_select "form[action=?][method=?]", application_letter_path(@application_letter), "post" do
      assert_select "textarea#application_letter_motivation[name=?]", "application_letter[motivation]"
    end
  end
end
