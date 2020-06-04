#seeds for the data base
#users table
dh = User.create(username: "Dhrubo", email: "dhrubo@gmail.com")
rasel = User.create(username: "Rasel", email: "rasel@gmail.com")
nasir = User.create(username: "Nasir", email: "nasir@yahoo.com")

#camapigns table
dh_campaign = Campaign.create(title: "Dhrubo's Fundraiser", 
description: "Hello I am doing this for my dog.",
goal_amount: 500, 
organizer_id: "#{dh.id}")

dh_campaign_2 = Campaign.create(title: "Dhrubo's Fundraiser for arrested protestors", 
description: "Hello help me raise enough fund to free arrested protestors from BLM movement.",
goal_amount: 10000, 
organizer_id: "#{dh.id}")

#donations table
rasel_donation = Donation.create(message: "Hope my contribution helps. Get well soon doggy!",
amount: 20,
donor_id: "#{rasel.id}",
campaign_id: "#{dh_campaign.id}")

rasel_donation = Donation.create(message: "Hope my contribution helps. FREE ALL THE PROTESTORS!",
amount: 200,
donor_id: "#{rasel.id}",
campaign_id: "#{dh_campaign_2.id}")

nasir_donation = Donation.create(message: "Here is little something to help your doggy!",
amount: 50,
donor_id: "#{nasir.id}",
campaign_id: "#{dh_campaign.id}")