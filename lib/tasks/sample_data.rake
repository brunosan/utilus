require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    20.times do |n|
      q=Question.create!(:title => Faker::Lorem.sentence)
      rand(10).times do |p|
        a=Answer.create!(:text=> Faker::Lorem.sentence,
                      :question_id => q.id)
        rand(20).times do |v|
          Vote.create!(:answer_id =>a.id )
        end
        rand(10).times do |f|
          Flag.create!(:answer_id =>a.id )
        end
      end
    end

  end
end

