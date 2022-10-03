class Hesi
  enum time: {
    "9:00am" => 0,
    "10:00am" => 1,
    "1:00pm" => 2,
    "4:00pm" => 3
  }

  # validates :time, inclusion: times.keys

  @@schedule = {
    'Monday' => ['10:00am'],
    'Tuesday' => ['9:00am', '4:00pm'],
    'Wednesday' => ['9:00am','1:00pm'],
    'Thursday' => ['9:00am', '1:00pm'],
    'Friday' => ['9:00am'],
    'Saturday' => ['9:00am']
}

  def self.schedule
    @@schedule
  end

  def times
    @@schedule[self.day]
  end

  def day
    @@schedule.keys[self.date.wday]
  end
end

