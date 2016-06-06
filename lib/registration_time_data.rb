class RegistrationTimeData

  attr_reader :hours, :days

  def initialize
    @hours = []
    @days = []
    @weekdays =
      { Sunday: "0",
        Monday: "1",
        Tuesday: "2",
        Wednesday: "3",
        Thursday: "4",
        Friday: "5",
        Saturday: "6" }
  end

  def get_data(data)
    @time = DateTime.strptime(data,'%m/%d/%y %H:%M')
    hours << @time.hour
    days << @time.wday
  end


  def convert_to_weekday(days)
    @weekdays.key(days.join)
  end




end
