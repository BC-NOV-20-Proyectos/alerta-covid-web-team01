symptoms = [
    { name: "Fever or chills"},
    { name: "Cough"},
    { name: "Chest pain when you breathe deeply"},
    { name: "Difficulty breathing"},
    { name: "Loss of smell"},
    { name: "Loss of taste"},
    { name: "Headache"},
    { name: "Fatigue or tiredness"},
    { name: "Muscle and body aches"},
    { name: "Throat irritation"},
    { name: "Diarrhea"},
    { name: "Conjunctivitis"},
    { name: "Congestion or runny nose"},
    { name: "Rashes"},
    { name: "Loss of color in the fingers or toes"},
    { name: "Nausea or vomiting"},
  ]
  
  p "Creating symptoms"
  
  symptoms.each { |symptom|
    admn = Symptom.find_or_create_by(name: symptom[:name])
  }
  
  puts "#{Symptom.count} of #{symptoms.size} symptoms created"