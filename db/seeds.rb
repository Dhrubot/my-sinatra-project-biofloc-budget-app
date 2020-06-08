#seeds for the data base
#users table
dh = User.create(firstname:"Dh", lastname: "tl", username: "Dhrubo", email: "dhrubo@gmail.com", password: "password987")
rasel = User.create(firstname:"Rasel", lastname: "An", username: "Rasel", email: "rasel@gmail.com", password: "password987")
nasir = User.create(firstname:"Nasir", lastname: "Mo", username: "Nasir", email: "nasir@yahoo.com", password: "password987")

#camapigns table
dh_campaign = Campaign.create(title: "Global Transformation of Race", 
description: "n the wake of George Floyd's death and the protests that have followed, it is time for a larger conversation on race and our responsibility in this context.  

Several transformational centers across the country and around the globe are partnering with Bettie J. Spruill, a veteran transformational trainer, and Tonya O. Parris, a trainer and center owner, to host a 'Transformation of Race' training on June 13 and 14.  And this training gets to be free to all who want to participate.  Our tribe gets to take the lead in making this conversation available to all, so we are committed to raising $8,000 in the next week, and to being fully responsible for this important next step.

What is the training, you ask?

Deepen your understanding and appreciation of the many ways in which race, ethnicity, and cultural diversity have shaped American institutions, ideology, law, and social relationships from the colonial era to the present.

By exploring race and ethnicity as a dynamic, complex ideological and cultural process that shapes all social institutions, belief systems, and individual experiences (worldview), you will expand your capacity to both love more deeply and love more courageously.",
goal_amount: 7000, 
organizer_id: "#{dh.id}")

dh_campaign_2 = Campaign.create(title: "Help Maria’s family", 
description: "We lost a wonderful member of the PS 222 community to COVID-19 on April 7, 2020. Maria was a loving woman with a big heart. She always had a big, warm smile on her face and never hesitated to offer help.

Maria was a doting mom and was always there for her son Darwin, from class 1-408. She was also an appreciated volunteer at our school at many school events.

She is survived by her 6 year old son and her husband.  We know this is a difficult time for all of us but any donations you can provide will go toward her funeral services and her family.

Thank you and we hope everyone is healthy and well!",
goal_amount: 30000, 
organizer_id: "#{dh.id}")

#donations table
rasel_donation = Donation.create(message: "Hope my contribution helps.",
amount: 200,
donor_id: "#{rasel.id}",
campaign_id: "#{dh_campaign.id}")

rasel_donation = Donation.create(message: "Hope my contribution helps.",
amount: 100,
donor_id: "#{rasel.id}",
campaign_id: "#{dh_campaign_2.id}")

nasir_donation = Donation.create(message: "May God bless you.",
amount: 500,
donor_id: "#{nasir.id}",
campaign_id: "#{dh_campaign.id}")