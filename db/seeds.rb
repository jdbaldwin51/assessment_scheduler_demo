# This file should contain all the record creation needed to seed the database with its default values.
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "date"



advisors = %w(JB RN BM CJS OL JW VF KN-RE)
def create_inv_code
  nums = (0..9).to_a
  nums.shuffle.take(7).join.to_i
end


Advisor.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('advisors')

advisors.each do |name|
  Advisor.create!(name: name, email: "#{name}@concorde.edu", invitation_code: create_inv_code)
end


Program.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('programs')



Program.create!(
              name: 'RT',
              minimum_sle: 17,
              minimum_hesi: 70
)

Program.create!(
              name: 'ST',
              minimum_sle: 17,
              minimum_hesi: 65
)

Program.create!(
              name: 'PN',
              minimum_sle: 17,
              minimum_hesi: 70,
              minimum_hesi_section: 60
)

Program.create!(
              name: 'PN-EW',
              minimum_sle: 17,
              minimum_hesi: 70,
              minimum_hesi_section: 60
)

Program.create!(
              name: 'PTA',
              minimum_sle: 18,
              minimum_hesi: 70
)

Program.create!(
              name: 'DH',
              minimum_sle: 20,
              minimum_hesi: 70
)

Program.create!(
              name: 'DMS',
              minimum_sle: 21,
              minimum_hesi: 75,
              minimum_hesi_section: 65
)

Program.create!(
              name: 'CVS',
              minimum_sle: 21,
              minimum_hesi: 75,
              minimum_hesi_section: 65
            )

Program.create!(
              name: 'BSN',
              minimum_sle: 22,
              minimum_hesi: 80,
              minimum_hesi_section: 70
)



Student.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('students')

# Student creation class
class StudentSeed
  attr_reader :name, :program, :start_date, :advisor, :sle, :phone, :attempt_number, :hesi_date, :hesi_time

  def initialize(name, date)
    @name = name
    @sle = rand(17..28)
    @program = pick_program
    @start_date = rand(0..6)
    @advisor = rand(1..8)
    @phone = pick_phone
    @attempt_number = rand(0..6)
    @hesi_date = pick_date(date)
    @hesi_time = times_for_wday(@hesi_date)
  end

  def pick_program
    case @sle
    when 17
      rand(1..4)
    when 18..19
      rand(1..5)
    when 20
      rand(1..6)
    when 21
      rand(1..8)
    else
      rand(1..9)
    end
  end

  def pick_phone
    "#{%w[816 913 660 785].sample}-555-#{rand(1000..9999)}"
  end

  # Campus is never open on Sunday, so if date select is a Sunday, need to add one day
  def pick_date(date)
    return date unless date.sunday?

    date + 1
  end

  # Hesi times differ per weekday, so need to choose a time based on date selected
  def times_for_wday(date)
    if date.monday?
      1
    elsif date.tuesday?
      [0, 3].sample
    elsif date.wednesday?
      [0, 2].sample
    elsif date.thursday?
      [0, 2].sample
    elsif date.friday? || date.saturday?
      0
    end
  end

  def self.seed_students(names, idx)
    names.each do |name|
      test_date = Date.today + idx
      student = StudentSeed.new(name, test_date)
      Student.create!(name: student.name, program_id: student.program, start_date: student.start_date,
                      advisor_id: student.advisor, sle: student.sle, phone: student.phone,
                      attempt_number: student.attempt_number,
                      hesi_date: student.hesi_date, hesi_time: student.hesi_time)
    end
  end
end

  names = [["silas wright", "bennett stewart", "declan diaz", "waylon davis", "weston cooper", "evan wilson", "emmett morgan", "micah morris", "ryder evans", "beau hill", "damian wood", "brayden diaz", "gael anderson", "rowan wood", "harrison jones", "bryson evans", "sawyer green", "amir brooks", "kingston ross", "jason harris", "giovanni murphy", "vincent gray", "ayden nelson", "chase robinson", "myles thompson", "diego lee", "nathaniel wright", "legend anderson", "jonah hayes", "river robinson", "tyler ward", "cole bell", "braxton phillips", "george allen", "milo martinez", "zachary wright", "ashton brooks", "luis mitchell", "jasper gonzalez", "kaiden washington", "adriel murphy", "gavin price", "bentley lewis", "calvin taylor", "zion rogers", "juan brown", "maxwell ward", "max anderson", "ryker torres", "carlos hall", "emmanuel sanchez", "jayce bell", "lorenzo wilson", "ivan jenkins", "jude kelly", "august torres", "kevin rodriguez", "malachi gonzales", "jane doe", "elliott johnson", "rhett garcia", "archer cook", "karter peterson","arthur hall", "luka phillips", "elliot martinez", "thiago powell", "brandon brooks", "camden bryant", "justin thomas", "jesus cook", "maddox watson", "king reed", "theo peterson", "enzo rodriguez", "matteo price", "emiliano ramirez", "dean torres", "hayden hayes", "finn jones", "brody phillips", "antonio diaz", "abel smith", "alex bennett", "tristan jones", "graham butler", "zayden patterson", "judah kelly", "xander baker", "miguel lopez", "atlas davis", "messiah king", "barrett lewis", "tucker cox", "timothy edwards", "alan davis", "edward ward", "leon mitchell", "dawson thomas", "eric gray"], ["liam king", "noah thomas", "oliver robinson", "elijah walker", "william powell", "james cook", "benjamin nelson", "lucas hughes", "henry brooks", "alexander murphy", "mason lopez", "michael watson", "ethan perez", "daniel jones", "jacob ward", "logan morris", "jackson robinson", "levi perez", "sebastian gonzales", "mateo martinez", "jack adams", "owen taylor", "theodore morris", "aiden collins", "samuel foster", "joseph young", "john clark", "david morris", "wyatt roberts", "matthew edwards", "luke simmons", "asher russell", "carter clark", "julian ramirez", "grayson morgan", "leo henderson", "jayden russell", "gabriel bryant", "isaac morgan", "lincoln sanders", "anthony torres", "hudson thomas", "dylan turner", "ezra perry", "thomas campbell", "charles ross", "christopher simmons", "jaxon parker", "maverick hill", "josiah murphy", "isaiah jones", "andrew rivera", "elias james", "joshua flores", "nathan alexander", "caleb thomas", "ryan martinez", "adrian walker", "miles murphy","eli baker", "nolan ward", "thurston howell", "christian henderson", "aaron edwards", "cameron jenkins", "ezekiel jenkins", "colton butler", "luca taylor", "landon garcia", "hunter wood", "jonathan hill", "santiago walker", "axel evans", "easton jenkins", "cooper cooper", "jeremiah flores", "angel harris", "roman king", "connor diaz", "jameson ramirez", "robert gonzales", "greyson jones", "jordan wilson", "ian henderson", "carson rogers", "jaxson johnson", "leonardo howard", "nicholas thomas", "dominic allen", "austin roberts", "everett powell", "brooks cook", "xavier jenkins", "kai bell", "jose gonzalez", "parker sanchez", "adam perry", "jace brooks", "wesley hernandez", "kayden griffin"]]

def variable_slice(arr, slice_sizes)
  return [] if slice_sizes.empty?

  i, *rest = slice_sizes
  [arr.first(i)].concat variable_slice(arr[i..], rest)
end

future_names = variable_slice(names[0], [3, 5, 1, 6, 3, 7, 9, 3, 2, 5])
past_names = variable_slice(names[1], [3, 5, 1, 6, 3, 7, 9, 3, 2, 5])

future_names.each_with_index { |name_list, idx| StudentSeed.seed_students(name_list, idx) }

past_names.each_with_index do |name_list, idx|
  idx *= -1
  idx -= 1
  StudentSeed.seed_students(name_list, idx)
end
