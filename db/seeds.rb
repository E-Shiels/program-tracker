  User.create(password: 'abcdefg', email: 'a@example.com', id: "1")
  User.create(password: '123456789', email: '1@123.com', id: "2")
  User.create(password: 'qwerty', email: 'mike@microsoft.com', id: "3")
  User.create(password: 'asdfgh', email: 'larry@gmail.com', id: "4")


  Program.create(name: 'Audacity', description: 'Free audio editing program', url: "https://www.audacityteam.org/", install_date: "September 05 2017", user_id: "1", category: "audio/image/video editing")
  Program.create(name: 'Slack', description: 'Communication platform, email replacmeent', url: "https://slack.com/downloads/windows", install_date: "July 19 2016", user_id: "1", category: "communication")
  Program.create(name: 'OBS Studio', description: 'Free screen recorder and streaming software', url: "https://obsproject.com/download", install_date: "October 15 2018", user_id: "1", category: "audio/image/video editing")
  Program.create(name: 'GIMP', description: 'Free image editing software', url: "https://www.gimp.org/", install_date: "December 11 2017", user_id: "1", category: "audio/image/video editing")

  Program.create(name: 'program name', description: 'it is a program', url: "install.com", install_date: "October 11 2018", user_id: "2", category: "games")
  Program.create(name: 'good program', description: 'it is a good program', url: "setup.ca", install_date: "October 12 2018", user_id: "2", category: "utilities")
  Program.create(name: 'great program', description: 'it is a great program', url: "download.co", install_date: "October 13 2018", user_id: "2", category: "photo editing")
  Program.create(name: 'bad program', description: 'it is a bad program', url: "test.co.uk", install_date: "October 14 2018", user_id: "2", category: "coding")

  Program.create(name: 'program name', description: 'it is a program', url: "install.com", install_date: "October 11 2018", user_id: "3",category: "games")
  Program.create(name: 'good program', description: 'it is a good program', url: "setup.ca", install_date: "October 12 2018", user_id: "3", category: "utilities")
  Program.create(name: 'great program', description: 'it is a great program', url: "download.co", install_date: "October 13 2018", user_id: "3", category: "photo editing")
  Program.create(name: 'bad program', description: 'it is a bad program', url: "test.co.uk", install_date: "October 14 2018", user_id: "3", category: "coding")

  Program.create(name: 'program name', description: 'it is a program', url: "install.com", install_date: "October 11 2018", user_id: "4", category: "games")
  Program.create(name: 'good program', description: 'it is a good program', url: "setup.ca", install_date: "October 12 2018", user_id: "4", category: "utilities")
  Program.create(name: 'great program', description: 'it is a great program', url: "download.co", install_date: "October 13 2018", user_id: "4", category: "photo editing")
  Program.create(name: 'bad program', description: 'it is a bad program', url: "test.co.uk", install_date: "October 14 2018", user_id: "4", category: "coding")
