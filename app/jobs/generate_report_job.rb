require 'open-uri'
class GenerateReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info "*********Inside Perform******** #{args} And #{args.class}"
    put_report_content(args[0])
    File.write("#{Rails.root}/app/assets/docs/drug_report.txt", put_report_content(study))
    # send_file "#{Rails.root}/app/assets/docs/drug_report.txt", type: "application/pdf", x_sendfile: true, filename: "#{args[0].title}_drug_report.txt"
  end

  private

  def put_report_content(study)
    site_names = study.sites.pluck(:name)
    subject_names = study.sites.collect { |site| site.subjects.collect { |sub| sub.name } }.flatten
    total_happy_count = 0
    total_sad_count = 0
    total_neutral_count = 0
    study.sites.each do |site|
      total_happy_count = total_happy_count + site.subjects.pluck(:rating).count('Happy')
      total_sad_count = total_sad_count + site.subjects.pluck(:rating).count('Sad')
      total_neutral_count = total_neutral_count + site.subjects.pluck(:rating).count('Neutral')
    end
    happy_percentage = (total_happy_count.to_f / study.no_of_subjects.to_f) * 100
    sad_percentage = (total_sad_count.to_f / study.no_of_subjects.to_f) * 100
    neutral_percentage = (total_neutral_count.to_f / study.no_of_subjects.to_f) * 100

    "Drug Report For Study: #{study.title}\nTherapeutic Area: #{study.therapeutic_area}\nPhase: #{study.phase}\nTotal no of sites: #{study.sites.size}\nTotal no of subjects: #{study.no_of_subjects}" +
      "\n\n***** Associated Sites *****\n#{site_names.join("\n")}" +
      "\n\n***** Associated Subjects *****\n#{subject_names.join("\n")}" +
      "\n\n***** Pecentage Feedback *****" +
      "\nHappy Percentage : #{happy_percentage}" +
      "\nSad Percentage : #{sad_percentage}" +
      "\nNeutral Percentage : #{neutral_percentage}"
  end
end
