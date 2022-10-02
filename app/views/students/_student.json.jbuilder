json.extract! student, :id, :name, :program_id, :start_date, :advisor_id, :sle, :phone, :attempt_number, :hesi_date, :hesi_time, :created_at, :updated_at
json.url student_url(student, format: :json)
