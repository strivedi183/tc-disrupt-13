User.delete_all
Event.delete_all
Content.delete_all
Permission.delete_all
Filter.delete_all

u1 = User.create(:email => 'a@gmail.com', :password => 'a', :password_confirmation => 'a')

e1 = Event.create(:name => 'event1', :address => '311 W 34th St, NYC', :latitude => 40.752856, :longitude => -73.9940476)
e2 = Event.create(:name => 'event2', :is_post_public => false)
e3 = Event.create(:name => 'TechCrunch', :description => 'NY Disrupt 2013', :address => '311 W 34th St, NYC', :latitude => 40.752856, :longitude => -73.9940476)

p1 = Permission.create(:network => 'Twitter', :handle => 'ScrappyTest')
p2 = Permission.create(:network => 'Instagram', :handle => 'khalua2')

f1 = Filter.create(:network => 'twitter', :tag => '#mechanical_pencil')
f2 = Filter.create(:network => 'instagram', :tag => 'mechanical_pencil')
f3 = Filter.create(:network => 'twitter', :tag => '#mechanical_pencil')
f4 = Filter.create(:network => 'instagram', :tag => 'mechanical_pencil')
f5 = Filter.create(:network => 'twitter', :tag => '#hackath_n')
f6 = Filter.create(:network => 'instagram', :tag => 'hackath_n')
f7 = Filter.create(:network => 'instagram', :tag => 'hackathon')
f8 = Filter.create(:network => 'instagram', :tag => 'hackdisrupt')


e2.permissions << p1 << p2
e1.filters << f1 << f2
e2.filters << f3 << f4
e3.filters << f5 << f6 << f7 << f8

u1.events << e1 << e2 << e3

e3.get_all_recent_tweets
e3.get_all_recent_instagrams
