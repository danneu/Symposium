# TODO

- Tests. It's painful to move ahead without a suite of tests. Lesson learned.
    - Model tests: Make sure validations are covered, make sure scopes order the
      records as wanted, test any instance methods.
    - Controller tests: Ensure that different things happen when admins,
      members, and guests try to access various controller actions.
    - Integration tests
- Private messaging: I can think of easy implementations of this that are common
  among popular forum software out there, but those implementations are painful
  relics of email before email software started topicing conversations
  together or text messaging before texts were arranged like an IM conversation.
    - Private messaging is pretty much identical to the Topics/Posts setup.
      Private conversations are just private Topics. 
    - I've never used mixins before in Ruby, but I'd like to try to package the
      Topics/Posts login into a module that I can mixin to Topics/Posts and
      Conversations/Messages for private messaging.
- Push notifications for new private messages and posts. A pain point in my
  vBulletin community is all the refreshing that users do to see if someone
  replied to them. Also, unless there's some sort of subscription system for
  topics, you have to manually revisit your posts to see if anyone responded to
  you.
    - Instead, you should be able to keep Symposium open in a tab and it will
      let you know when you have new messages/responses.
    - I'd like to implement this on new private messages first since I still
      have to think about how notifications for posts would work.
- A subscription system for topics.
    - You shouldn't receive updates for every topic you've ever posted in.
    - Users should manually subscribe to topics they wish to receive
      notifications for.
    
