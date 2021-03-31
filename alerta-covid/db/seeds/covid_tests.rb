tests = [
  { name: "Rapid Blood Test"},
  { name: "Rapid Antigen Test"},
  { name: "PCR Test (Polymerase Chain Reaction)"},
]

p "Creating covid tests"

tests.each { |covid_test|
  admn = CovidTest.find_or_create_by(name: covid_test[:name])
}

puts "#{CovidTest.count} of #{tests.size} covid tests created"
