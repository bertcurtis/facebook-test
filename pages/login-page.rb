require_relative '../base-page.rb'
class LoginPage < BasePage
  def initialize
    @browser = driver
  end
  def browser
    return @browser
  end
  def firstName_textField
    return @browser.find_element(:id,'u_0_p')
  end
  def lastName_textField
    return @browser.find_element(:id,'u_0_r')
  end
  def email_textField
    return @browser.find_element(:id,'u_0_u')
  end
  def emailReenter_textField
    return @browser.find_element(:id,'u_0_w')
  end
  def password_textField
    return @browser.find_element(:id, 'u_0_11')
  end
  def month_dropDown
    return @browser.find_element(:id,'month')
  end
  def day_dropDown
    return @browser.find_element(:id,'day')
  end
  def year_dropDown
    return @browser.find_element(:id,'year')
  end

  def signUp_button
    return @browser.find_element(:id,'u_0_17')
  end

  def male_radio
    return @browser.find_element(:id, 'u_0_a')
  end
  def error_alert
    return @browser.find_element(:id, 'reg_error_inner')
  end

end