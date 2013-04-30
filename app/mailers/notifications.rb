class Notifications < ActionMailer::Base
  def send_invite(inviter, event, params)
    emails = params[:invites].split(',')
    @inviter = inviter
    @event = event
    @twitter_hashtags = params[:twitter_hashtags].split
    @twitter_handles = params[:twitter_handles].split
    @instagram_hashtags = params[:instagram_hashtags].split
    @instagram_handles = params[:instagram_handles].split
    emails.each do |email|
      mail :to => email, :from => ENV['EMAIL'], :subject => "You've been invited to Albumeer"
    end
  end
end