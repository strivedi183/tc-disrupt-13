class Notifications < ActionMailer::Base
  def send_invite(user, invites, twitter_hashtags, twitter_handles, instagram_hashtags, instagram_handles)
    email = invites
    @user = user
    @twitter_hashtags = twitter_hashtags.split
    @twitter_handles = twitter_handles.split
    @instagram_hashtags = instagram_hashtags.split
    @instagram_handles = instagram_handles.split
    mail :to => email, :from => ENV['EMAIL'], :subject => "You've been invited to Albumeer"
  end
end