class Hesi < ApplicationRecord

  has_many :students

  WEEK_DAYS = ['Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

  def self.times_for_day
    {
      'Monday' => ['10:00am'],
      'Tuesday' => ['9:00am', '4:00pm'],
      'Wednesday' => ['9:00am', '1:00pm'],
      'Thursday' => ['9:00am', '1:00pm'],
      'Friday' => ['9:00am'],
      'Saturday' => ['9:00am']
    }
  end

  def self.student_count(date,time)
    Student.where(hesi_date: date, hesi_time: self.test_times[time]).count
  end

  def self.day_of_week(date)
    WEEK_DAYS[date.wday]
  end

  def self.date(date)
    date.to_fs(:long_ordinal)
  end


  def self.future_hesi_dates
    hesi_dates = Student.where(hesi_date: 0.day.ago..Float::INFINITY).distinct.pluck(:hesi_date).sort
  end

  def self.past_hesi_dates
    hesi_dates = Student.where('hesi_date < ?', Date.today).distinct.pluck(:hesi_date).sort
  end
  def self.testers_for_date_and_time(date, time)
    Student.where(hesi_date: date, hesi_time: time)
  end


  enum test_time: {
    "9:00am" => 0,
    "10:00am" => 1,
    "1:00pm" => 2,
    "4:00pm" => 3
  }
end
