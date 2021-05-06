roles = [
  { name: 'Super Admin' },
  { name: 'Data Reporter' },
  { name: 'Customer' },
]

p 'Creating roles'

roles.each { |role|
  admn = Role.find_or_create_by(name: role[:name])
}

puts "#{Role.count} of #{roles.size} roles created"
