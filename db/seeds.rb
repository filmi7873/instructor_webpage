# Instructor
User.find_or_create_by!(email: "brutus@osu.edu") do |user|
  user.password = "password"
  user.name = "Brutus Buckeye"
  user.admin = true
end

# TA
User.find_or_create_by!(email: "ta@osu.edu") do |user|
  user.password = "password"
  user.name = "TA"
  user.admin = true
end

# Students
students = [
  ["Alice", "alice@osu.edu"],
  ["Bob", "bob@osu.edu"],
  ["Carol", "carol@osu.edu"],
  ["Dave", "dave@osu.edu"],
  ["Eve", "eve@osu.edu"],
  ["Frank", "frank@osu.edu"],
  ["Grace", "grace@osu.edu"],
  ["Heidi", "heidi@osu.edu"],
  ["Ivan", "ivan@osu.edu"],
  ["Judy", "judy@osu.edu"]
].map do |name, email|
  User.find_or_create_by!(email: email) do |user|
    user.password = "password"
    user.name = name
    user.admin = false
  end
end

# Premade Events
event1 = Event.create!(
  title: "The Fall of the Roman Empire",
  description: "A discussion of internal and external factors that led to the collapse."
)
event2 = Event.create!(
  title: "WWII: The Pacific Front",
  description: "Student presentations analyzing strategies used in the Pacific theater."
)

# Assign presenters to premade events
event1.presenters << students[0] # Alice
event1.presenters << students[1] # Bob
event2.presenters << students[2] # Carol

# Premade Audience evaluations
Evaluation.create!(
  event: event1,
  student: students[2], # Carol
  presenter_id: students[0].id,
  clarity: 4,
  organization: 3,
  technical: 3,
  comments: "interesting take on rome. cool visuals."
)

Evaluation.create!(
  event: event1,
  student: students[3], # Dave
  presenter_id: students[1].id,
  clarity: 2,
  organization: 2,
  technical: 2,
  comments: "i kinda zoned out ngl but i liked the part about the barbarians"
)

Evaluation.create!(
  event: event2,
  student: students[4], # Eve
  presenter_id: students[2].id,
  clarity: 5,
  organization: 4,
  technical: 4,
  comments: "Really well presented! I learned a lot about island-hopping."
)

Evaluation.create!(
  event: event2,
  student: students[5], # Frank
  presenter_id: students[2].id,
  clarity: 3,
  organization: 4,
  technical: 3,
  comments: "she talked really fast but it was kinda engaging"
)

Evaluation.create!(
  event: event1,
  student: students[6], # Grace
  presenter_id: students[0].id,
  clarity: 1,
  organization: 1,
  technical: 1,
  comments: "bro read off the slides and said 'uh' every 2 seconds"
)

Evaluation.create!(
  event: event2,
  student: students[7], # Heidi
  presenter_id: students[2].id,
  clarity: 4,
  organization: 5,
  technical: 4,
  comments: "A little long but very well organized and clear."
)