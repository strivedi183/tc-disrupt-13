class Notifications < ActionMailer::Base
  def send_invite(email, user)
    @user = user
    mail :to => email, :from => ENV['EMAIL'], :subject => "You've been invited to Albumeer"
  end
end