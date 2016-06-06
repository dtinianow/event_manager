class PhoneNumber

attr_reader :user_input

  def initialize(user_input)
    @user_input = user_input
  end

  def clean_phone_number
    number = remove_extra_chars(@user_input)
    phone_number = check_if_number_is_valid(number)
    format_as_phone_number(phone_number)
  end

  def remove_extra_chars(user_input)
    user_input.tr('^0-9', '')
  end

  def check_if_number_is_valid(number)
    if number.length == 11 && number[0] == "1"
      number[1..-1]
    elsif number.length != 10
      "0000000000"
    else
      number
    end
  end

  def format_as_phone_number(phone_number)
    area_code = phone_number[0..2]
    exchange = phone_number[3..5]
    extension = phone_number[6..9]
    "#{area_code}-#{exchange}-#{extension}"
  end


end
