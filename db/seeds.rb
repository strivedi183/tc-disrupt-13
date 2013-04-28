User.delete_all
Event.delete_all
Content.delete_all
Permission.delete_all
Filter.delete_all

u1 = User.create(:email => 'a@gmail.com', :password => 'a', :password_confirmation => 'a')

e1 = Event.create(:name => 'event1', :address => '311 W 34th St, NYC', :latitude => 40.752664, :longitude => -73.994309)

u1.events << e1