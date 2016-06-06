require 'minitest/autorun'
require 'minitest/pride'
require './lib/phone_number'

class PhoneNumberTest < Minitest::Test

  def test_phone_number_takes_a_raw_input
    phone_number = PhoneNumber.new("1(607)-280 2000")
    assert_equal "1(607)-280 2000", phone_number.user_input
  end

  def test_able_to_remove_extra_chars
    #skip
    phone_number = PhoneNumber.new("1(607)-280 2000")
    assert_equal "16072802000", phone_number.remove_extra_chars("1(607)-280 2000")
  end

  def test_able_check_is_number_is_valid
    #skip
    num = PhoneNumber.new("16072802000")
    assert_equal "6072802000", num.check_if_number_is_valid("16072802000")
    num = PhoneNumber.new("072802000")
    assert_equal "0000000000", num.check_if_number_is_valid("072802000")
  end

  def test_able_to_format_as_phone_number
    num = PhoneNumber.new("6072802000")
    assert_equal "607-280-2000", num.format_as_phone_number("6072802000")
  end

  def test_able_to_turn_raw_input_into_clean_phone_number
    num = PhoneNumber.new("1(607)-280 2000")
    assert_equal "607-280-2000", num.clean_phone_number
    num = PhoneNumber.new("03298")
    assert_equal "000-000-0000", num.clean_phone_number
  end

end
