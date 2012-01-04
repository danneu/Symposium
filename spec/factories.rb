Factory.define :member, class: User do |f|
  f.username "testman"
  f.email "testman@example.com"
  f.password "secret"
  f.role "member"
end

Factory.define :admin, class: User do |f|
  f.username "testman"
  f.email "testman@example.com"
  f.password "secret"
  f.role "admin"
end
