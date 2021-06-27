namespace :generate do
  desc "This rake task generates drug report"
  task :report, [:study_name] => :environment do |task, args|
    puts "********** DRUG REPORT **********"
    study = Study.find_by(title: args[:study_name])
    if study.nil?
      puts "No such study found in the system"
    else
      puts "Name of the Drug: #{args[:study_name]}"
      puts "Phase of the Drug: #{study.phase}"
      puts "No of subjects trialled: #{study.no_of_subjects}"

      total_happy_count = 0
      study.sites.each do |site|
        total_happy_count = total_happy_count + site.subjects.pluck(:rating).count('Happy')
      end
      happy_percentage = (total_happy_count.to_f / study.no_of_subjects.to_f) * 100
      puts "Total Happy Subjects: #{total_happy_count}"
      puts "Happy Feedback Percentage: #{happy_percentage} %"

      if (happy_percentage > 70)
        #1. Move the drug to next phase
        if study.phase < 5
          study.update(phase: study.phase+1)
          puts "Study phase have been updated to #{study.phase}"
        else
          puts "Study already in final phase of trial"
        end

        #2. Deactivate all current subjects
        study.sites.each {|site| site.subjects.update(active: false)}
        puts "Subjects belonging to study #{study.title} have been deactivated!"
      else
        study.update(redacted: true)
        puts "Study have been derailed!"
      end
    end
  end
end

# task :my_task, [:first_param, :second_param] do |t, args|
#   puts args[:first_param]
#   puts args[:second_param]
# end