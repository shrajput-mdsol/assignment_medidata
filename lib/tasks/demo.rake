namespace :demotask do
  desc 'Demo rake task for getting the current environment'
  task :current_environment => :environment do
    puts "You are running the rake task in #{Rails.env} environment"
  end
end
#rake demotask:current_environment       # Demo rake task for getting the current environment

# namespace :add do
#   desc 'Rake task to add subjects to a study'
#   task :subject, [:study_name, :subject_count] => :environment do |task, args|
#     obtained_study = Study.find_by_name(args[:study_name])
#     abort('Study not found') unless obtained_study
#     #Adding subjects
#     args[:subject_count].to_i.times do
#       begin
#         subj = Subject.create!(name: Faker::Name.unique.name,
#                                age: rand(obtained_study.age_limit..100))
#         enrollment = Enrollment.create!(study: obtained_study,
#                                         subject: subj)
#         puts "Subject named: #{subj.name} is successfully enrolled, Enrollment Id is: #{enrollment.id}!"
#       rescue => e
#         puts "Couldn't enroll student named: #{subj.name} because of #{e.message}!"
#       end
#     end
#   end
# end
