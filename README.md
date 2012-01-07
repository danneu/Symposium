# Symposium

* *In ancient Greece, a symposium was a drinking party for people of good family to debate, plot, boast, or simply to revel with others.*
* Github: https://github.com/danneu/symposium

-----

*Note*: I'm now aware of Ryan Bigg's (Radar's) [forem](https://github.com/radar/forem) which is a forum you can drop in to a Rails app. But I wanted to start my own from scratch for education purposes, and I didn't want to become jaded by reading his implementation.

* **Forem Live Demo**: http://forem.herokuapp.com/
* **Symposium Live Demo**: http://agathon.herokuapp.com/

-----

## Why?

For an educating experience, to hack around in, to practice Rails, and to gain experience with services like Heroku and New Relic.

But also I run a really big vBulletin forum where I absolutely despise trying to code my own features for that software. Digging into the code of such a legacy, monolithic PHP application has burned me out consistantly every time I try to add features for my users. My long-term ambition is to port my vBulletin database to Symposium and refine how it handles millions of posts.

-----

## The tools I'm using

* **Heroku** (Cedar stack) for hosting. I pine for a hosting solution for my vBulletin forum where I could feed it more resources with a slider bar and watch the impact in New Relic. I'm no database admin, so I've been logging countless nights into trying to figure out why the community's server would die on me. 
* **Sorcery** for authentication (logging in, logging out, current_user). It's much lighter and flexible than Devise. ([github](https://github.com/NoamB/sorcery)) ([railscast](http://railscasts.com/episodes/283-authentication-with-sorcery))
* **CanCan** for authorization (the admin role can create forums, the member role can only edit their own topics, etc.). ([github](https://github.com/ryanb/cancan)) ([railscast](http://railscasts.com/episodes/192-authorization-with-cancan))
* **Twitter Bootstrap** as a CSS framework. You'll notice that Symposium is clean and pretty in its [live demo](http://agathon.herokuapp.com/). I find development much more enjoyable when the application already looks alright from the first commit. It helps me think in turns of user experience as I code. It's also getting a responsive design in version 2.0. ([website](http://twitter.github.com/bootstrap/))
* **bb-ruby** for post formatting. It renders bbcode from `@post.body` into HTML in `@post.rendered_body`. bb-ruby is to bbcode as RDiscount is to Markdown. 

    Example bbcode: 
    * [b]bold[/b] 
    * [url="http://domain.com"]click me[/url]
    
    I prefer Markdown for formatting, but the internet is familiar with flagship software like vBulletin, phpbb, and Invision which all use bbcode. ([github](https://github.com/cpjolicoeur/bb-ruby)) ([website](http://bb-ruby.rubyforge.org/))

-----

## The implementation

As you would imagine:

* Models: User, Forum, Topic, Post, Ability (for CanCan)
* User Roles: Admin, Member, Banned, Guest
* Associations
  * Forums have many Topics
  * Topics have many Posts
  * Users have many Topics and Posts (as creator, so `@topic.creator`, `@post.creator`)
* Nesting:

        # routing
        resources :forums do
          resources :topics
        end
        resources :topics do
          resources :posts
        end

-----

## General/Short-term TODO list 

* **Tests**. I feel really guilty about not having them, but testing is painfully slow on my netbook (my development machine at the moment) and I can't get Spork to work on it. I can't imagine feeling comfortable about something like authorization without a comprehensive test suite.
* **Private Messaging**
* **Authorization**: Some basic authorization is started, but since I don't have tests for authorization, it's easier for me to manually test privileges.
* **Clean up views**. I judo'd my way through a few things in the views just to get them to work.

    Example: To display who made the last post on the forum#index:

        forum.latest_topic.latest_post.creator.username
