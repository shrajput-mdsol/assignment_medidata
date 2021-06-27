require 'pry-byebug'

#this module contains methods applicable for a Person
module Person
  def initialize_name_and_age(name, age)
    @name = name
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end
end

#patient class
class Patient
  include Person

  CONSENTED = "consented"
  UNCONSENTED = "not_consented"

  @@consented = 0
  @@unconsented = 0

  attr_accessor :email, :contact, :gender, :consent

  def initialize(name, age, email, contact, gender, consent)
    initialize_name_and_age name, age
    @email = email
    @contact = contact
    @gender = gender
    @consent = consent
    update_consent_status
  end

  #this method returns true if a person eligible for trial, false otherwise
  def eligible_for_trial?
    if gender.eql? 'M'
      age > 12 ? true : false
    elsif gender.eql? 'F'
      age > 15 ? true : false
    end
  end

  #this method updates the overall consent status
  private
  def update_consent_status
    if consent.eql? Patient::CONSENTED
      @@consented += 1
    else
      @@unconsented += 1
    end
  end

  #this method returns the total consented patients
  def self.consented_patients
    @@consented
  end

  #this method returns the total unconsented patients
  def self.unconsented_patients
    @@unconsented
  end

  #this method returns the consent percentage
  def self.consent_percentage
    total_patients = @@consented + @@unconsented
    consent_percentage = (@@consented.to_f / total_patients.to_f) * 100
    consent_percentage.round(2).to_s + "%"
  end
end

#clinician class
class Clinician
  include Person

  attr_accessor :speciality, :region, :status

  def initialize(name, age, speciality, region, status)
    initialize_name_and_age name, age
    @speciality = speciality
    @region = region
    @status = status
  end

  #this method updated the clinician status based on region & speciality
  def update_clinician_status
    binding.pry
    #(region.eql? "India") && (speciality.eql? "dentist")
    if region == "India" && speciality != "dentist"
      self.status = "active"
    end
    return nil
  end
end

#adding patients
patients = [Patient.new('Ram', 21 ,'ram@gmail.com', 8839197434, 'M', 'consented'),
            Patient.new('Sita', 14 ,'sita@gmail.com', 8839198134, 'F', 'unconsented'),
            Patient.new('Lakhan', 18 ,'ram@gmail.com', 8839197434, 'M', 'consented')]

#printing the details of patients
for patient in patients
  print "Patient with name as #{patient.name} is #{patient.eligible_for_trial? ? "eligible" : "not eligible"} for trial\n"
end

#printing overall details
print "Consented Patients: #{Patient.consented_patients}\nUnconsented Patients: #{Patient.unconsented_patients}\nConsent Percentage: #{Patient.consent_percentage}\n"


#adding clinicians
clinicians = [Clinician.new('Mr. Tyagi', 60, 'neuro', 'India', 'inactive'),
              Clinician.new('Mrs. Pathak', 60, 'dentist', 'India', 'inactive')]

#printing details for clinicians after updating their status
for clinician in clinicians
  print "Clinician with name as #{clinician.name} is having the status as #{clinician.update_clinician_status}#{clinician.status}\n"
end