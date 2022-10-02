class Program < ApplicationRecord
  has_many :students
  enum hesi_time: {
    "9:00am" => 0,
    "10:00am" => 1,
    "1:00pm" => 2,
    "4:00pm" => 3
  }

  enum start_date: {
    'Nov 28th, 2022' => 0,
    'Feb 13th, 2023' => 1,
    'April 24th, 2023' => 2,
    'July 3rd, 2023' => 3,
    'Aug 28th, 2023(PN-EW)' => 4,
    'Sept 18th, 2023' => 5,
    'Nov 27th, 2023' => 6
  }
end
