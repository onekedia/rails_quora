require 'test_helper'

class QuestionTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_topic = question_topics(:one)
  end

  test "should get index" do
    get question_topics_url
    assert_response :success
  end

  test "should get new" do
    get new_question_topic_url
    assert_response :success
  end

  test "should create question_topic" do
    assert_difference('QuestionTopic.count') do
      post question_topics_url, params: { question_topic: { question_id: @question_topic.question_id, topic_id: @question_topic.topic_id } }
    end

    assert_redirected_to question_topic_url(QuestionTopic.last)
  end

  test "should show question_topic" do
    get question_topic_url(@question_topic)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_topic_url(@question_topic)
    assert_response :success
  end

  test "should update question_topic" do
    patch question_topic_url(@question_topic), params: { question_topic: { question_id: @question_topic.question_id, topic_id: @question_topic.topic_id } }
    assert_redirected_to question_topic_url(@question_topic)
  end

  test "should destroy question_topic" do
    assert_difference('QuestionTopic.count', -1) do
      delete question_topic_url(@question_topic)
    end

    assert_redirected_to question_topics_url
  end
end
