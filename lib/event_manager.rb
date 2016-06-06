require 'csv'
require 'sunlight/congress'
require 'erb'
require './lib/phone_number'
require './lib/registration_time_data'
require 'pry'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

###Find hours methods
def list_frequency(time)
  time.each_with_object(Hash.new(0)){|key,time| time[key] += 1}
end

def get_peak(list)
  max = list.values.max
  peak = list.select { |key, value| value == max }
  peak.keys
end


###Find hours methods

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

reg_time = RegistrationTimeData.new

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)

  phone_number = PhoneNumber.new(row[:homephone]).clean_phone_number
  time = reg_time.get_data(row[:regdate])
  # registration_time =  DateTime.strptime(row[:regdate],'%m/%d/%y %H:%M')
  # save_thank_you_letters(id,form_letter)
end

peak_hours = list_frequency(reg_time.hours)
puts get_peak(peak_hours)
peak_days = list_frequency(reg_time.days)
puts weekdays.key([get_peak(peak_days)].join)
