p "Creating Institutions"

Institution.find_or_create_by(name: "Brightcoders")

p "Creating Departments"

Departament.find_or_create_by(name: "Development", institution_id: Institution.find_by(name: "Brightcoders").id)

p "Creating Users"

users = [
  {
    email: "admin-frania@alertacovid.com",
    full_name: "Frania",
    lastname: "Suarez",
    born_date: Date.new(1998, 01, 01),
    gender: "2",
    role_id: Role.find_by(name: "Super Admin").id, 
    departament_id: Departament.find_by(name: "Development").id
  },
  {
    email: "admin-ariel@alertacovid.com",
    full_name: "Ariel",
    lastname: "May",
    born_date: Date.new(1998, 01, 01),
    gender: "1",
    role_id: Role.find_by(name: "Super Admin").id, 
    departament_id: Departament.find_by(name: "Development").id
  },
  {
    email: "admin-adrian@alertacovid.com",
    full_name: "Adrian",
    lastname: "Rama",
    born_date: Date.new(1998, 01, 01),
    gender: "1",
    role_id: Role.find_by(name: "Super Admin").id, 
    departament_id: Departament.find_by(name: "Development").id
  },
  {
    email: "admin-mario@alertacovid.com",
    full_name: "Mario",
    lastname: "Mancilla",
    born_date: Date.new(1998, 12, 17),
    gender: "1",
    role_id: Role.find_by(name: "Super Admin").id, 
    departament_id: Departament.find_by(name: "Development").id
  }
]

users.each { |user|
  user = User.find_or_create_by(email: user[:email], full_name: user[:full_name], lastname: user[:lastname], born_date: user[:born_date], gender: user[:gender], role_id: user[:role_id], departament_id: user[:departament_id])
  user.password = "alertacovid123"
  user.confirmed_at = Date.today
  user.save
}

puts "Finished"