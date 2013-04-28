User.delete_all
Event.delete_all
Content.delete_all
Permission.delete_all
Filter.delete_all

u1 = User.create(:email => 'a@gmail.com', :password => 'a', :password_confirmation => 'a')

e1 = Event.create(:name => 'event1', :is_post_public => true)

u1.events << e1