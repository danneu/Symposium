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
                    email: "lol@lol.com") 
admin.update_attributes(role: "admin")
admin.save
member = User.create(username: "member",
                     password: "member",
                     email: "lol@lol.com")


#topic_titles = ["This forum rules!", "Someone respond to this :(", "What is your favorite number?",
                #"Let's play a game.", "LOL", "Can someone explain something to me?"]
#Forum.all.each do |forum|
  #topic_titles.each do |title|
    #forum.topics.create(title: title, creator: member)
    #forum.topics.create(title: title, creator: admin)
  #end
#end

#paragraphs = ["Maecenas eu lectus pulvinar nisi blandit adipiscing at et nisi. Quisque eget neque nec enim fringilla dictum. Duis mattis risus et nisl tincidunt pharetra. Vivamus blandit dictum nisl vitae volutpat. Maecenas euismod erat nec purus rhoncus ut suscipit felis adipiscing. Morbi diam neque, venenatis egestas feugiat ut, sollicitudin eu purus. Nullam lobortis augue quis arcu pellentesque ut varius orci condimentum. Maecenas sit amet venenatis nulla. Maecenas sollicitudin nisl et nisl laoreet ultricies. Quisque non lorem id tellus vestibulum aliquam. Cras eu eros at lorem facilisis ornare eget quis metus.", "Proin dignissim faucibus felis. Vivamus viverra mollis euismod. Pellentesque mauris dolor, rutrum auctor hendrerit eget, facilisis et dui. Etiam sem erat, porta pulvinar sodales id, interdum et risus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla sed sem urna. Suspendisse potenti. Vivamus ipsum sapien, vehicula quis viverra id, tempus id mauris. Etiam euismod gravida neque eget pretium. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur eu felis nec elit tempor venenatis quis quis massa.", "Morbi dictum aliquam turpis, ac elementum sem rhoncus quis. Aliquam vestibulum euismod luctus. Etiam ut neque vel dolor pulvinar tempus nec a dolor. Praesent dapibus fringilla vehicula. Aliquam erat volutpat. In sit amet purus ac ante faucibus placerat. Proin a orci mauris, id rutrum sapien. Duis justo eros, malesuada quis elementum ut, faucibus et augue. Nulla mattis sem nulla. Nulla in orci quis leo consequat tempor. Maecenas scelerisque dui cursus sapien hendrerit hendrerit. Fusce eu porta mauris. Curabitur eget dolor sit amet urna dignissim porta. Maecenas libero odio, pellentesque at sagittis non, convallis vitae arcu. Etiam eget tellus ut mi ultricies placerat sed ut libero.", "Donec malesuada commodo nulla in sodales. Nam sed feugiat turpis. Fusce eu ultricies enim. Morbi sit amet erat ac ante sodales porttitor a a velit. Curabitur vulputate enim eget lorem fermentum ornare. Vestibulum sed aliquam leo. Aenean ac est odio. Cras commodo posuere lacus, eu sollicitudin sapien volutpat non. Maecenas hendrerit sagittis lacinia. Donec eget enim et lectus varius viverra.", "Nunc pellentesque nisl sem. Phasellus sit amet neque sed turpis mollis mattis nec quis erat. Cras euismod varius adipiscing. Pellentesque faucibus, libero eget ornare luctus, nisi metus blandit ipsum, sit amet pharetra nisi mi sit amet augue. Duis volutpat auctor lacus a facilisis. Donec erat tortor, suscipit in cursus vitae, faucibus at est. Vestibulum semper, urna id adipiscing commodo, ligula mauris pellentesque purus, sed ultricies erat elit vitae turpis. Duis vitae dolor augue, sit amet hendrerit magna. Curabitur elementum sem ut velit varius vitae hendrerit dolor eleifend. Duis et ante turpis, sed pretium ligula. Aliquam facilisis suscipit commodo. Nulla eget dapibus nisl."]

#Topic.all.each do |topic|
  #paragraphs.each do |p|
    #topic.posts.create(body: p, creator: member)
    #topic.posts.create(body: p, creator: admin)
  #end
#end
