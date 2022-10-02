json.extract! advisor, :id, :name, :email, :invitation_code, :created_at, :updated_at
json.url advisor_url(advisor, format: :json)
