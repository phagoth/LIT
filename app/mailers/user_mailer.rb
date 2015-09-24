class UserMailer < ApplicationMailer
default from: 'info@lit-cv.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://lit-cv.herokuapp.com'
    mail(to: @user.email, subject: 'Добро пожаловать')
  end

end
