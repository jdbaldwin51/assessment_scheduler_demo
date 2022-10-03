class Hesi < ApplicationRecord
  enum :test_time, {
    "9:00am"  => 0,
    "10:00am" => 1,
    "1:00pm"  => 2,
    "4:00pm"  => 3
  }
end
