User.delete_all
Event.delete_all
Content.delete_all
Permission.delete_all
Filter.delete_all

u1 = User.create(:email => 'a@gmail.com', :password => 'a', :password_confirmation => 'a')

e1 = Event.create(:name => 'event1', :address => '311 W 34th St, NYC', :latitude => 40.752856, :longitude => -73.9940476)
e2 = Event.create(:name => 'event2', :is_post_public => false)

p1 = Permission.create(:network => 'Twitter', :handle => 'ScrappyTest')
p2 = Permission.create(:network => 'Instagram', :handle => 'khalua2')

f1 = Filter(:network => 'Twitter', :tag => '#mechanical_pencil')
f2 = Filter(:network => 'instagram', :tag => 'mechanical_pencil')

e2.permissions << p1 << p2

u1.events << e1 << e2
