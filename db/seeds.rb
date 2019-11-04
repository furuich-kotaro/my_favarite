User.create!(
  name: 'test',
  email: 'test@gmail.com',
  password: 'password'
)

10.times do
  Post.create!(
    address: '東京',
    description: 'this place is one of my favarite place}',
    pictures: [open("#{Rails.root}/spec/factories/test.jpg")],
    latitude: 35.6585805,
    longitude: 139.7454329,
    user_id: 1
  )
end
