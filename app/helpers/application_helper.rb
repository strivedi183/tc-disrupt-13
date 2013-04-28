module ApplicationHelper
  def parse_tweet(tweet)
    tweet = tweet.split(' ')
    new_tweet = []
    tweet.each do |phrase|
      if phrase.include?('http')
        @phrase = phrase
      else
        new_tweet << phrase
      end
    end
    tweet = new_tweet.join(' ')
  end
end
