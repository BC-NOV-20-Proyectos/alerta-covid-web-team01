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

permissions = Permission.all.pluck(:id).compact

permissions.each do |id|
  permission = Permission.find(id)
  Role.first.permissions << permission
end

puts "#{Role.count} of #{roles.size} roles created"
