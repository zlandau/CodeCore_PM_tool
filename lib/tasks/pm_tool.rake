namespace :pm_tool do

  desc "Generate a summary list of all newly created tasks that day for projects "
  task :list_tasks => :environment do

  end


  desc "Generate ten questions with 10 answers each"
  task :questions_and_answers => :environment do
    10.times do
      question = Question.create(title: Faker::Lorem.sentence(10), description: Faker::Lorem.sentence(30))
      10.times do
        question.answers.create(body: Faker::Company.bs)
      end
    end
  end

  desc "Generate a summary list of all newly created discussions that day for projects"
  task :list_discussions => :environment do

  end

end
