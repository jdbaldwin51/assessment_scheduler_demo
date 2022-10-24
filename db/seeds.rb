# This file should contain all the record creation needed to seed the database with its default values.
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require_relative "names"
Student.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('students')


class StudentSeed
  attr_reader :name, :program, :start_date, :advisor, :sle, :phone, :attempt_number, :hesi_date, :hesi_time
  @@date = 0
  @@counter = 0
  def initialize(name)
    @name = name
    @sle = rand(17..28)
    @program = set_program
    @start_date = rand(0..6)
    @advisor = rand(1..9)
    @phone = set_phone
    @attempt_number = rand(0..6)
    @hesi_date = set_date
    @hesi_time = times_for_wday(@hesi_date)
    puts self.class.counter
    if self.class.counter == 5
      self.class.date += 1
      self.class.counter = 0
    end
   end

  def self.date
    @@date
  end

  def self.date=(value)
    @@date = value
  end

  def self.counter
    @@counter
  end

  def self.counter=(value)
    @@counter = value
  end

  def set_program
    case @sle
    when 17
      [5,6,8,9].sample
    when 18..19
      [5,6,7,8,9].sample
    when 20
      4
    when 21
      rand(2..3)
    else
      rand(1..9)
    end
  end

  def set_phone
    "#{['816', '913','660','785'].sample}-555-#{rand(1000..9999)}"
  end

  def set_date
    date = Date.today + self.class.date 

    if date.sunday?
      date += 1
      return date
    else
      return date
    end
   
  end

  def times_for_wday(date)
    if date.monday?
      1
    elsif date.tuesday?
      [0,3].sample
    elsif date.wednesday?
      [0,2].sample
    elsif date.thursday?
      [0,2].sample
    elsif date.friday? || date.saturday?
      0
    end
  end
end




  
def seed_future_students(idx1,idx2)
  names[idx1..idx2].each do |name|
    student = StudentSeed.new(name)
    Student.create!(name: student.name, program_id: student.program, start_date: student.start_date, advisor_id: student.advisor, sle: student.sle, phone: student.phone, attempt_number: student.attempt_number, hesi_date: student.hesi_date, hesi_time: student.hesi_time)
    StudentSeed.counter += 1
  end

end

seed_students(0,50)

