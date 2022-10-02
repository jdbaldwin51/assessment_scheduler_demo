class Student < ApplicationRecord
  belongs_to :program
  belongs_to :advisor

  enum attempt_number: {
    "1st attempt" => 0,
    "Retake for higher score" => 1,
    "Retake:All" => 2,
    "Retake:Math" => 3,
    "Retake:Math+Vocab" => 4,
    "Retake:Math+Reading" => 5,
    "Retake:Reading+Vocab" => 6
  }
end
