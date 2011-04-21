require 'ffaker'

Factory.define :game do |f|
  f.opponent { Faker::Address.city }
  f.home_away { ["Home", "Away"][rand(2)] }
  f.game_date {Date.today}
  f.game_time {Time.now}
end

Factory.define :invalid_game, :parent => :game do |f|
  f.opponent nil
  f.home_away nil
  f.game_date nil
  f.game_time nil
end

Factory.define :user do |f|
  f.email { Faker::Internet.email }
  f.password { "secret1234" }
  f.password_confirmation { |u| u.password }
  f.sign_in_count { 2 }
  f.confirmed_at { Date.today }
end