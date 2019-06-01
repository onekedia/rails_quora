require "application_system_test_case"

class QuestionTopicsTest < ApplicationSystemTestCase
  setup do
    @question_topic = question_topics(:one)
  end

  test "visiting the index" do
    visit question_topics_url
    assert_selector "h1", text: "Question Topics"
  end

  test "creating a Question topic" do
    visit question_topics_url
    click_on "New Question Topic"

    fill_in "Question", with: @question_topic.question_id
    fill_in "Topic", with: @question_topic.topic_id
    click_on "Create Question topic"

    assert_text "Question topic was successfully created"
    click_on "Back"
  end

  test "updating a Question topic" do
    visit question_topics_url
    click_on "Edit", match: :first

    fill_in "Question", with: @question_topic.question_id
    fill_in "Topic", with: @question_topic.topic_id
    click_on "Update Question topic"

    assert_text "Question topic was successfully updated"
    click_on "Back"
  end

  test "destroying a Question topic" do
    visit question_topics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question topic was successfully destroyed"
  end
end
