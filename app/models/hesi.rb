class Hesi < ApplicationRecord

  def testers_for_date(date)
    @students = Student.where(":hesi_date = ?", date)
  end
  
  def todays_testers
    @testers = Student.where("hesi_date = ?", Date.today)
  end

  enum test_time: {
    "9:00am" => 0,
    "10:00am" => 1,
    "1:00pm" => 2,
    "4:00pm" => 3
  }
end
