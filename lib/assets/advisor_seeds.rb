
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
