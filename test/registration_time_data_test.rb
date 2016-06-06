require './lib/registration_time_data'
require 'minitest/autorun'
require 'minitest/pride'

class RegistrationTimeDataTest < Minitest::Test

  def test_gets_time_and_date_of_registration
    rt = RegistrationTimeData.new("11/13/08 16:40")
    assert_equal "11/13/08 16:40", rt.registration
  end

end
