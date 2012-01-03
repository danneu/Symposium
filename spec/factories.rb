Factory.define :member do |f|
  f.username "testman"
  f.email "testman@example.com"
  f.password "secret"
  f.role "member"
end

Factory.define :admin do |f|
  f.username "testman"
  f.email "testman@example.com"
  f.password "secret"
  f.role "admin"
end
