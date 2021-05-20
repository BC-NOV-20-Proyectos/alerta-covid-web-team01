roles = [
  { name: 'Super Admin' },
  { name: 'Admin Institution' },
  { name: 'Final User' },
  { name: 'Data Reporter' }
]

p 'Creating roles'

roles.each { |role|
  admn = Role.find_or_create_by(name: role[:name])
}

Role.first.permissions << Permission.all

puts "#{Role.count} of #{roles.size} roles created"
