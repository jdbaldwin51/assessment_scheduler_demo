class Hesi < ApplicationRecord

  has_many :students
  def testers_for_date(date)
    @students = Student.where("hesi_date = ?", date)
  end
  
  def self.todays_testers
    Student.where("hesi_date = ?", Date.today)
  end

  def self.testers_for(day)
    Student.where("hesi_date = ?", Date.tomorrow.sunday? ? Date.tomorrow + 1 : Date.tomorrow)
  end

  def testers_for_week
    [method(:todays_testers), method(:tomorrows_testers)]
  end





  enum test_time: {
    "9:00am" => 0,
    "10:00am" => 1,
    "1:00pm" => 2,
    "4:00pm" => 3
  }
end
