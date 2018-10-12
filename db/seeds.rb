  User.create(password_digest: 'abcdefg', email: 'a@example.com')
  User.create(password_digest: '123456789', email: '1@123.com')

  Program.create(name: 'program name', description: 'it is a program', url: "www.google.com", install_date: "Tuesday, October 11 2018", user_id: "1")
  Program.create(name: 'program name', description: 'it is a program', url: "www.google.com", install_date: "Tuesday, October 11 2018", user_id: "4")

  Category.create(name: 'utilities')
  Category.create(name: 'games')
  Category.create(name: 'photo and video')
