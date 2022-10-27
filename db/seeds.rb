# This file should contain all the record creation needed to seed the database with its default values.
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require_relative "names"
require "date"
Student.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('students')


class StudentSeed
  attr_reader :name, :program, :start_date, :advisor, :sle, :phone, :attempt_number, :hesi_date, :hesi_time
  @@student_count = 0

  def initialize(name,date)
    @name = name
    @sle = rand(17..28)
    @program = set_program
    @start_date = rand(0..6)
    @advisor = rand(1..9)
    @phone = set_phone
    @attempt_number = rand(0..6)
    @hesi_date = set_date(date)
    @hesi_time = times_for_wday(@hesi_date)
    self.class.student_count += 1
   end

  def self.student_count
    @@student_count
  end

  def self.student_count=(value)
    @@student_count = value
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

  def set_date(date)
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


  def self.seed_future_students
    test_date = Date.today
    prev_testers = 0
    15.times do |i|
      limit = [4,5,6,7,8].sample

      current_testers = names[prev_testers..(prev_testers + limit)].map {|name| StudentSeed.new(name, test_date)}
      prev_testers += limit


      current_testers.each do |student|
        Student.create!(name: student.name, program_id: student.program, start_date: student.start_date, advisor_id: student.advisor, sle: student.sle, phone: student.phone, attempt_number: student.attempt_number, hesi_date: student.hesi_date, hesi_time: student.hesi_time)

      end
      test_date += 1

    end
  end

  def self.seed_past_students
    test_date = Date.today - 1
    count = self.student_count + 1
    15.times do |i|
      limit = [4,5,6,7,8].sample
      current_testers = names[count..(count + limit)].map { |name| StudentSeed.new(name, test_date)  }

      current_testers.each do |student|
        Student.create!(name: student.name, program_id: student.program, start_date: student.start_date, advisor_id: student.advisor, sle: student.sle, phone: student.phone, attempt_number: student.attempt_number, hesi_date: student.hesi_date, hesi_time: student.hesi_time)
      end
      test_date -= 1

    end
  end
end







StudentSeed.seed_future_students
StudentSeed.seed_past_students
