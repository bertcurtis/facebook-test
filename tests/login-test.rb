require_relative '../base-test.rb'
require_relative '../pages/login-page.rb'

class LoginTest
  def initialize
    @loginPage=LoginPage.new
    @test=BaseTest.new(@loginPage.browser, "https://facebook.com")
  end
  def enter_invalid_birthday_test
    input_first_and_last_name
      .verify_no_email_reenter_then_input_email
      .input_reenter_email
      .input_password
      .select_gender
      .select_birthday("2015")
    assert(@loginPage.error_alert.value != null)
  end
  def input_first_and_last_name
    @loginPage.firstName_textField.send_keys("Divvy")
    @loginPage.lastName_textField.send_keys("Test")
    self
  end
  def verify_no_email_reenter_then_input_email
    assert(@loginPage.emailReenter_textField.find_element(:class, 'placeholder').attribute("aria-hidden").value == "true")
    @loginPage.email_textField.send_keys("divvy@test.com")
    self
  end
  def input_reenter_email
    @loginPage.emailReenter_textField.send_keys("divvy@test.com")
    self
  end
  def input_password
    @loginPage.password_textField.send_keys("nothanks")
    self
  end
  def select_gender
    @loginPage.male_radio.click
  end
  def select_birthday(year)
    @loginPage.month_dropDown.find_elements( :tag_name => "option" ).find do |option|
      option.text == "Aug"
    end.click
    @loginPage.day_dropDown.find_elements( :tag_name => "option" ).find do |option|
      option.text == "22"
    end.click
    @loginPage.year_dropDown.find_elements( :tag_name => "option" ).find do |option|
      option.text == year
    end.click
    self
  end
end

@test.run( LoginTest.new.enter_invalid_birthday_test, @loginPage.browser )



