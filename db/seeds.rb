# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Forum.destroy_all
Topic.destroy_all
User.destroy_all

Forum.create(name: "News and Announcements",
             description: "Official news is posted here.")
Forum.create(name: "Newbie Introductions",
             description: "Are you new? Come say hello!")
Forum.create(name: "Off-Topic Discussion",
             description: "Talk about anything.")

admin = User.create(username: "admin",
                    password: "admin",
                    email: "lol@lol.com",
                    role: "admin") # This won't work once I exclude it from attr accessible
member = User.create(username: "member",
                     password: "member",
                     email: "lol@lol.com")


topic_titles = ["This forum rules!", "Someone respond to this :(", "What is your favorite number?",
                "Let's play a game.", "LOL", "Can someone explain something to me?"]
Forum.all.each do |forum|
  topic_titles.each do |title|
    forum.topics.create(title: title, creator: member)
    forum.topics.create(title: title, creator: admin)
  end
end
