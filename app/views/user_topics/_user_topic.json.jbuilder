json.extract! user_topic, :id, :user_id, :topic_id, :created_at, :updated_at
json.url user_topic_url(user_topic, format: :json)
