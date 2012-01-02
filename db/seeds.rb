# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Forum.destroy_all

Forum.create(name: "News and Announcements",
             description: "Official news is posted here.")
Forum.create(name: "Newbie Introductions",
             description: "Are you new? Come say hello!")
Forum.create(name: "Off-Topic Discussion",
             description: "Talk about anything.")

