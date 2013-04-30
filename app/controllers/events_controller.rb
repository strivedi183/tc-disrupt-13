class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(params[:event])
    if params[:twitter_hashtags].present?
      twitter_hashtags = params[:twitter_hashtags].split(',')
      twitter_hashtags.each do |twitter_hashtag|
        twitter_hashtag = twitter_hashtag.squish
        twitter_hashtag.prepend('#') if twitter_hashtag[0] != '#'
        filter = Filter.create(:network => 'twitter', :tag => twitter_hashtag)
        @event.filters << filter
      end
    end
    if params[:instagram_hashtags].present?
      instagram_hashtags = params[:instagram_hashtags].split(',')
      instagram_hashtags.each do |instagram_hashtag|
        instagram_hashtag = instagram_hashtag.squish
        if instagram_hashtag[0] == '#'
          instagram_hashtag = instagram_hashtag.delete('#')
        end
        filter = Filter.create(:network => 'instagram', :tag => instagram_hashtag)
        @event.filters << filter
      end
    end
    if params[:twitter_handles].present?
      twitter_handles = params[:twitter_handles].split(',')
      twitter_handles.each do |twitter_handle|
        twitter_handle = twitter_handle.squish
        if twitter_handle[0] == '@'
          twitter_handle = twitter_handle.delete('@')
        end
        permission = Permission.create(:network => 'twitter', :handle => twitter_handle)
        @event.permissions << permission
      end
    end
    if params[:instagram_handles].present?
      instagram_handles = params[:instagram_handles].split(',')
      instagram_handles.each do |instagram_handle|
        instagram_handle = instagram_handle.squish
        if instagram_handle[0] == '@'
          instagram_handle = instagram_handle.delete('@')
        end
        permission = Permission.create(:network => 'instagram', :handle => instagram_handle)
        @event.permissions << permission
      end
    end

    if params[:invites].present?
      Notifications.send_invite(@auth, @event, params).deliver
    end

    @event.get_all_recent_tweets
    @event.get_all_recent_instagrams
    redirect_to (@event)
  end
  def index
    @events = Event.where(:is_view_public? == true)
  end

  def show
    @event = Event.find(params[:id])
  end
end
