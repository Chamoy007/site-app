require 'rails_helper'

describe "Listing notes" do

  it "displays no items when question is empty" do
    FactoryGirl.create(:category)
    FactoryGirl.create(:survey_with_questions, questions_count: 1)

    visit surveys_path

    click_link "Questions"

    click_link "Notes"

    expect(page).to have_content("Listing Notes")
    expect(page).to have_content("Factory Question")
    expect(page.all("tbody tr").size).to eq(0)

  end

  it "displays items when question is not empty" do
    FactoryGirl.create(:question_with_notes)

    visit surveys_path

    click_link "Questions"

    click_link "Notes"

    expect(page).to have_content("Listing Notes")
    expect(page).to have_content("Factory Question")

    # First two notes where created in edit_spec.rb
    expect(page).to have_content("Note 4")
    expect(page).to have_content("Note 5")
    expect(page).to have_content("Note 6")

    expect(page.all("tbody tr").size).to eq(3)
  end

  it "redirects to survey questions by clicking the Survey button" do
    FactoryGirl.create(:question_with_notes)

    visit surveys_path

    click_link "Questions"

    click_link "Notes"

    expect(page).to have_content("Survey")
    click_link "Survey"
    expect(page).to have_content("Listing Questions")
    expect(page).to have_content("Factory Question")

  end

end
