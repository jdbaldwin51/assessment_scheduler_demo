
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
