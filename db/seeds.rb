# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Advisor.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('advisors')
Advisor.create!(name: "Joshua Baldwin", email: "jbaldwin@concorde.edu", invitation_code: 3131046)
Advisor.create!(name: "Richard Netwal", email: "rnetwal@concorde.edu", invitation_code: 3115131)
Advisor.create!(name: "Joshua Williams", email: "jwilliams@concorde.edu", invitation_code: 3231083)
Advisor.create!(name: "Brett Mendez", email: "bmendez@concorde.edu", invitation_code: 3229673)
Advisor.create!(name: "Stephanie Wirken", email: "swirken@concorde.edu", invitation_code: 3227027)
Advisor.create!(name: "Osvauldo Luna", email: "oluna@concorde.edu", invitation_code: 3092436)
Advisor.create!(name: "Chris Scherrer", email: "cscherrer@concorde.edu", invitation_code: 3036489)
Advisor.create!(name: "Vanessa Fox", email: "vfox@concorde.edu", invitation_code: 3235134)
Advisor.create!(name: "Katie Nat", email: "knat@concorde.edu", invitation_code: 0000)




Program.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('programs')
Program.create!(name: "BSN", minimum_sle: 22, minimum_hesi: 80, minimum_hesi_section: 70)
Program.create!(name: "CVS", minimum_sle: 21, minimum_hesi: 75, minimum_hesi_section: 65)
Program.create!(name: "DMS", minimum_sle: 21, minimum_hesi: 75, minimum_hesi_section: 65)
Program.create!(name: "DH", minimum_sle: 20, minimum_hesi: 70)
Program.create!(name: "PN", minimum_sle: 17, minimum_hesi: 70, minimum_hesi_section: 65)
Program.create!(name: "PN-EW", minimum_sle: 17, minimum_hesi: 70, minimum_hesi_section: 65)
Program.create!(name: "PTA", minimum_sle: 18, minimum_hesi: 70)
Program.create!(name: "RT", minimum_sle: 17, minimum_hesi: 70)
Program.create!(name: "ST", minimum_sle: 17, minimum_hesi: 70)

Student.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('students')
Student.create!(name: "Jane Doe",  program_id: 1, start_date: 2,  advisor_id: 4, sle: 23,phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-26', hesi_time: 0)
Student.create!(name: "Sally Fields",  program_id: 6, start_date: 4, advisor_id: 1, sle: 17, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-28', hesi_time: 0)
Student.create!(name: "Tom Brady", program_id: 2, start_date: 4, advisor_id: 5,  sle: 25, phone: "816-555-3025",  attempt_number: 0, hesi_date: '2022-10-15', hesi_time: 0)
Student.create!(name: "Ashley Alcatraz", program_id: 3, start_date: 4,  advisor_id: 2, sle: 23, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-14', hesi_time: 0)
Student.create!(name: "Patrick Mahomes", program_id: 4, start_date: 4,  advisor_id: 3,sle: 24, phone: "816-555-3025",  attempt_number: 0, hesi_date: '2022-10-17', hesi_time: 1)
Student.create!(name: "Selma Hayek", program_id: 4, start_date: 4, advisor_id: 7, sle: 23, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-14', hesi_time: 0)
Student.create!(name: "LaQuisha Brown", program_id: 5, start_date: 4, advisor_id: 4, sle: 21, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-18', hesi_time: 3)
Student.create!(name: "Shanequa Allen", program_id: 9, start_date: 4, advisor_id: 5, sle: 29, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-25', hesi_time: 3)
Student.create!(name: "Taylor Moore", program_id: 7, start_date: 4, advisor_id: 6, sle: 27, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-25', hesi_time: 3)
Student.create!(name: "Elizabeth Scott", program_id: 8, start_date: 4, advisor_id: 1, sle: 17, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-26', hesi_time: 2)
Student.create!(name: "Allyson Peters", program_id: 8, start_date: 4, advisor_id: 2, sle: 18, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-13', hesi_time: 0)
Student.create!(name: "Fernanda Gonzalez", program_id: 6, start_date: 4, advisor_id: 3, sle: 19, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-25', hesi_time: 3)
Student.create!(name: "Ashley Judd", program_id: 8, start_date: 4, advisor_id: 3, sle: 27, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-24', hesi_time: 1)
Student.create!(name: "Tedd Lasso", program_id: 2, advisor_id: 7, start_date: 4, sle: 21, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-25', hesi_time: 3)
Student.create!(name: "Thurston Howell", program_id: 4, start_date: 4, advisor_id: 5, sle: 20, phone: "816-555-3025", attempt_number: 0, hesi_date: '2022-10-25', hesi_time: 3)
