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

@@names = ["Liam King", "Noah Thomas", "Oliver Robinson", "Elijah Walker", "William Powell", "James Cook", "Benjamin Nelson", "Lucas Hughes", "Henry Brooks", "Alexander Murphy", "Mason Lopez", "Michael Watson", "Ethan Perez", "Daniel Jones", "Jacob Ward", "Logan Morris", "Jackson Robinson", "Levi Perez", "Sebastian Gonzales", "Mateo Martinez", "Jack Adams", "Owen Taylor", "Theodore Morris", "Aiden Collins", "Samuel Foster", "Joseph Young", "John Clark", "David Morris", "Wyatt Roberts", "Matthew Edwards", "Luke Simmons", "Asher Russell", "Carter Clark", "Julian Ramirez", "Grayson Morgan", "Leo Henderson", "Jayden Russell", "Gabriel Bryant", "Isaac Morgan", "Lincoln Sanders", "Anthony Torres", "Hudson Thomas", "Dylan Turner", "Ezra Perry", "Thomas Campbell", "Charles Ross", "Christopher Simmons", "Jaxon Parker", "Maverick Hill", "Josiah Murphy", "Isaiah Jones", "Andrew Rivera", "Elias James", "Joshua Flores", "Nathan Alexander", "Caleb Thomas", "Ryan Martinez", "Adrian Walker", "Miles Murphy", "Eli Baker", "Nolan Ward", "Thurston Howell", "Christian Henderson", "Aaron Edwards", "Cameron Jenkins", "Ezekiel Jenkins", "Colton Butler", "Luca Taylor", "Landon Garcia", "Hunter Wood", "Jonathan Hill", "Santiago Walker", "Axel Evans", "Easton Jenkins", "Cooper Cooper", "Jeremiah Flores", "Angel Harris", "Roman King", "Connor Diaz", "Jameson Ramirez", "Robert Gonzales", "Greyson Jones", "Jordan Wilson", "Ian Henderson", "Carson Rogers", "Jaxson Johnson", "Leonardo Howard", "Nicholas Thomas", "Dominic Allen", "Austin Roberts", "Everett Powell", "Brooks Cook", "Xavier Jenkins", "Kai Bell", "Jose Gonzalez", "Parker Sanchez", "Adam Perry", "Jace Brooks", "Wesley Hernandez", "Kayden Griffin", "Silas Wright", "Bennett Stewart", "Declan Diaz", "Waylon Davis", "Weston Cooper", "Evan Wilson", "Emmett Morgan", "Micah Morris", "Ryder Evans", "Beau Hill", "Damian Wood", "Brayden Diaz", "Gael Anderson", "Rowan Wood", "Harrison Jones", "Bryson Evans", "Sawyer Green", "Amir Brooks", "Kingston Ross", "Jason Harris", "Giovanni Murphy", "Vincent Gray", "Ayden Nelson", "Chase Robinson", "Myles Thompson", "Diego Lee", "Nathaniel Wright", "Legend Anderson", "Jonah Hayes", "River Robinson", "Tyler Ward", "Cole Bell", "Braxton Phillips", "George Allen", "Milo Martinez", "Zachary Wright", "Ashton Brooks", "Luis Mitchell", "Jasper Gonzalez", "Kaiden Washington", "Adriel Murphy", "Gavin Price", "Bentley Lewis", "Calvin Taylor", "Zion Rogers", "Juan Brown", "Maxwell Ward", "Max Anderson", "Ryker Torres", "Carlos Hall", "Emmanuel Sanchez", "Jayce Bell", "Lorenzo Wilson", "Ivan Jenkins", "Jude Kelly", "August Torres", "Kevin Rodriguez", "Malachi Gonzales","Jane Doe", "Elliott Johnson", "Rhett Garcia", "Archer Cook", "Karter Peterson", "Arthur Hall", "Luka Phillips", "Elliot Martinez", "Thiago Powell", "Brandon Brooks", "Camden Bryant", "Justin Thomas", "Jesus Cook", "Maddox Watson", "King Reed", "Theo Peterson", "Enzo Rodriguez", "Matteo Price", "Emiliano Ramirez", "Dean Torres", "Hayden Hayes", "Finn Jones", "Brody Phillips", "Antonio Diaz", "Abel Smith", "Alex Bennett", "Tristan Jones", "Graham Butler", "Zayden Patterson", "Judah Kelly", "Xander Baker", "Miguel Lopez", "Atlas Davis", "Messiah King", "Barrett Lewis", "Tucker Cox", "Timothy Edwards", "Alan Davis", "Edward Ward", "Leon Mitchell", "Dawson Thomas", "Eric Gray", "Ace Cooper", "Victor Lee", "Abraham Young", "Nicolas Miller", "Jesse Lopez", "Charlie Moore", "Patrick Jackson", "Walker Kelly", "Joel Russell", "Richard Morris", "Beckett Martinez", "Blake Gonzales", "Alejandro Thompson", "Avery Walker", "Grant Cooper", "Peter Scott", "Oscar Washington", "Matias Morris", "Amari James", "Lukas Rodriguez", "Andres Young", "Arlo Lewis", "Colt Patterson", "Adonis Torres", "Kyrie Johnson", "Steven Bell", "Felix Patterson", "Preston Gonzales", "Marcus Adams", "Holden Barnes", "Emilio Carter", "Remington Cox", "Jeremy Washington", "Kaleb Smith", "Brantley Allen", "Bryce Reed", "Mark Harris", "Knox Johnson", "Israel Lee", "Phoenix Adams", "Kobe Brown", "Nash Edwards", "Griffin Butler", "Caden Alexander", "Kenneth Evans", "Kyler Kelly", "Hayes Phillips", "Jax Perry", "Rafael Griffin", "Beckham Scott", "Javier Sanders", "Maximus Long", "Simon Ward", "Paul Johnson", "Omar Nelson", "Kaden Powell", "Kash Butler", "Lane Cox", "Bryan Garcia", "Riley Nelson", "Zane Garcia", "Louis Alexander", "Aidan Clark", "Paxton Kelly", "Maximiliano Flores", "Karson Griffin", "Cash Patterson", "Cayden Johnson", "Emerson Campbell", "Tobias Brown", "Ronan Kelly", "Brian Parker", "Dallas Long", "Bradley Roberts", "Jorge Johnson", "Walter Richardson", "Josue Perez", "Khalil Mitchell", "Damien Jenkins", "Jett Foster", "Kairo Turner", "Zander Jackson", "Andre Allen", "Cohen Lewis", "Crew Gonzales", "Hendrix Perry", "Colin Brooks", "Chance Foster", "Malakai Barnes", "Clayton Stewart", "Daxton Edwards", "Malcolm Smith", "Lennox Ross", "Martin Diaz", "Jaden Jackson", "Kayson Sanders", "Bodhi Wilson", "Francisco Thompson", "Cody Edwards", "Erick Taylor", "Kameron Hill", "Atticus Young", "Dante Campbell", "Jensen Davis", "Cruz White", "Finley Clark", "Brady Taylor", "Joaquin Thomas", "Anderson Powell", "Gunner Green", "Muhammad Morris", "Zayn Clark", "Derek Clark", "Raymond Harris", "Kyle Gonzalez", "Angelo Johnson", "Reid Gonzales", "Spencer Mitchell", "Nico Price", "Jaylen Edwards", "Jake Bryant", "Prince Parker", "Manuel Sanders", "Ali James", "Gideon Johnson", "Stephen Jackson", "Ellis Thompson", "Orion Edwards", "Rylan Jenkins", "Eduardo Simmons", "Mario Stewart", "Rory Robinson", "Cristian Simmons", "Odin Cook", "Tanner Cook", "Julius Price", "Callum White", "Sean Williams", "Kane Watson", "Ricardo Brown", "Travis Gonzales", "Wade Anderson", "Warren Lee", "Fernando Thompson", "Titus White", "Leonel Mitchell", "Edwin Taylor", "Cairo Brown", "Corbin King", "Dakota Wood", "Ismael Harris", "Colson Moore", "Killian Collins", "Major Cox", "Tate Perry", "Gianni Garcia", "Elian Martinez", "Remy Patterson", "Lawson Peterson", "Niko Peterson", "Nasir Brooks", "Kade Robinson", "Armani Smith", "Ezequiel Scott", "Marshall Rodriguez", "Hector Butler", "Desmond Barnes", "Kason Ramirez", "Garrett Cooper", "Jared Gonzalez", "Cyrus Butler", "Russell Mitchell", "Cesar Gonzalez", "Sarah Lopez", "Tyson Patterson", "Malik Cox", "Donovan Richardson", "Jaxton Cox", "Cade Hall", "Romeo Allen", "Nehemiah Smith", "Sergio Carter", "Iker Adams", "Caiden Jenkins", "Jay Smith", "Pablo Parker", "Devin Morris", "Jeffrey Long", "Otto Sanders", "Kamari Washington", "Ronin Parker", "Johnny Henderson", "Clark Ramirez", "Marco Martin", "Edgar Gray", "Bowen Flores", "Jaiden Johnson", "Grady Thomas", "Zayne Mitchell", "Sullivan Collins", "Jayceon Hayes", "Sterling Griffin", "Andy James", "Conor Butler", "Raiden Walker", "Royal Sanders", "Royce Hayes", "Solomon Garcia", "Trevor Bryant", "Winston Sanchez", "Emanuel Alexander", "Finnegan Alexander", "Pedro Smith", "Luciano Lewis", "Harvey Cooper", "Franklin Walker", "Noel Gonzales", "Troy Ross", "Princeton Carter", "Johnathan Reed", "Erik Evans", "Fabian Rodriguez", "Oakley King", "Rhys Nelson", "Porter Long", "Hugo Peterson", "Frank Price", "Damon Kelly", "Kendrick Rodriguez", "Mathias Collins", "Milan Hughes", "Peyton Scott", "Wilder Wright", "Callan Coleman", "Gregory Phillips", "Seth Hayes", "Matthias Scott", "Briggs Allen", "Ibrahim Roberts", "Roberto Griffin", "Conner Smith", "Quinn Collins", "Kashton Washington", "Sage Torres", "Santino Kelly", "Kolton Brooks", "Alijah Baker", "Dominick Bell", "Zyaire Rodriguez", "Apollo Henderson", "Kylo Anderson", "Reed Thomas", "Philip Adams", "Kian Miller", "Shawn Perry", "Kaison Parker", "Leonidas Bailey", "Ayaan Wood", "Lucca Hall", "Memphis Gray", "Ford White", "Baylor Hill", "Kyson Howard", "Uriel Garcia", "Allen Bell", "Collin Baker", "Ruben Adams", "Archie James", "Dalton Bennett", "Esteban Murphy", "Adan Murphy", "Forrest Young", "Alonzo Adams", "Isaias Murphy", "Leland Barnes", "Jase Gray", "Dax Gray", "Kasen Smith", "Gage Rodriguez", "Kamden Rogers", "Marcos Scott", "Jamison Powell", "Francis Patterson", "Hank Coleman", "Alexis Martin", "Tripp Hall", "Frederick Washington", "Jonas Turner", "Stetson Long", "Cassius Jackson", "Izaiah Evans", "Eden Phillips", "Maximilian Diaz", "Rocco Campbell", "Tatum Long", "Keegan Long", "Aziel Price", "Moses Robinson", "Bruce Lopez", "Lewis Phillips", "Braylen Alexander", "Omari Collins"]
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

  # Campus is never open on Sunday, so if date select is a Sunday, need to add one day
  def set_date(date)
    if date.sunday?
      date += 1
      return date
    else
      return date
    end

  end

  def self.names
    @@names
  end

  # Hesi times differ per weekday, so need to choose a time based on date selected
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


  def self.seed_students(i)
    test_date = Date.today + i
    limit = (1..9).to_a.sample
    current_names = []
    limit.times { current_names << @@names.shift}
    current_testers = current_names.map {|name| StudentSeed.new(name, test_date)}
    current_testers.each do |student|
        Student.create!(name: student.name, program_id: student.program, start_date: student.start_date, advisor_id: student.advisor, sle: student.sle, phone: student.phone, attempt_number: student.attempt_number, hesi_date: student.hesi_date, hesi_time: student.hesi_time)
    end
    current_testers.each { |name| @@names << name}
  end


end







(0..15).each {|i| StudentSeed.seed_students(i) }

(-16..-1).each { |i| StudentSeed.seed_students(i) }
