class Program < ApplicationRecord
  has_many :students
  enum start_date: {
    'Nov 28th, 2022'        => 0,
    'Feb 13th, 2023'        => 1,
    'April 24th, 2023'      => 2,
    'July 3rd, 2023'        => 3,
    'Aug 28th, 2023(PN-EW)' => 4,
    'Sept 18th, 2023'       => 5,
    'Nov 27th, 2023'        => 6
  }

  def full_name
    {"DH" => "Dental Hygiene",
    "BSN" => "Bachelors of Science-Nursing",
    "PN" => "Practical Nursing",
    "PN-EW" => "Practical Nursing-Evening&Weekend",
    "DMS" => "Diagnostic Medical Sonography",
    "CVS" => "Cardiovascular Sonography",
    "PTA" => "Physical Therapy Assisting",
    "RT" => "Respiratory Therapy",
    "ST" => "Surgical Technology"}[self.name]
  end
end
