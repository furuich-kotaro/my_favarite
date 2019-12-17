User.create!(
  name: 'test',
  email: 'test@gmail.com',
  password: 'password'
)

30.times do |i|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

Post.create(
  address: '東京タワー',
  description: '実際に自分の足で登ると思い出になるよ',
  pictures: [
              open("#{Rails.root}/app/assets/images/posts/東京タワー/1.jpg"),
              open("#{Rails.root}/app/assets/images/posts/東京タワー/2.jpg")
            ],
  latitude: 35.658581,
  longitude: 139.745433,
  tag_list: '東京,タワー,絶景',
  user_id: 1
)

Post.create(
  address: '渋温泉',
  description: '千と千尋の神隠し」のモデルにもなったといわれる、ノスタルジックな温泉街',
  pictures: [
              open("#{Rails.root}/app/assets/images/posts/渋温泉/1.jpg"),
              open("#{Rails.root}/app/assets/images/posts/渋温泉/2.jpg"),
              open("#{Rails.root}/app/assets/images/posts/渋温泉/3.jpg")
            ],
  latitude: 36.733696,
  longitude: 138.433344,
  tag_list: '温泉,聖地巡礼,千と千尋の神隠し,絶景',
  user_id: 1
)

Post.create(
  address: '中山千枚田',
  description: '香川県小豆島にある「中山の千枚田」は、ヘクタールに約800枚の棚田が広がる田園です。',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/中山千枚田/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/中山千枚田/2.jpg")
  ],
  latitude: 34.504093,
  longitude: 134.239404,
  tag_list: '離島,田んぼ,絶景,自然,田舎',
  user_id: 1
)

Post.create(
  address: '八方池',
  description: '白馬連峰を映す神秘的な池',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/八方池/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/八方池/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/八方池/3.jpg")
  ],
  latitude: 36.697121,
  longitude: 137.798859,
  tag_list: '池,絶景,自然',
  user_id: 2
)

Post.create(
  address: '国営ひたち海浜公園',
  description: '実際に自分の足で登ると思い出になるよ',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/国営ひたち海浜公園/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/国営ひたち海浜公園/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/国営ひたち海浜公園/3.jpg")
  ],
  latitude: 36.40604,
  longitude: 140.598225,
  tag_list: '公園,花,絶景,自然',
  user_id: 2
)

Post.create(
  address: '角島大橋',
  description: '青い海と1780mの大橋が作り出す絶景',
  pictures:[
    open("#{Rails.root}/app/assets/images/posts/角島大橋/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/角島大橋/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/角島大橋/3.jpg")
  ],
  latitude: 34.360624,
  longitude: 130.875331,
  tag_list: '離島,橋,絶景,海',
  user_id: 3
)

Post.create(
  address: '竜王マウンテンパーク',
  description: '雲海が高確率で楽しめる天空テラス',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/竜王/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/竜王/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/竜王/3.jpg")
  ],
  latitude: 36.783958,
  longitude: 138.456294,
  tag_list: 'カフェ,雲海,絶景,自然',
  user_id: 3
)

Post.create(
  address: '青い池',
  description: '偶然生まれたコバルトブルーの絶景',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/青い池/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/青い池/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/青い池/3.jpg")
  ],
  latitude: 43.49342 ,
  longitude: 142.614019,
  tag_list: '池,青い池,絶景,自然',
  user_id: 4
)

Post.create(
  address: '寸又峽',
  description: '吊橋から眺める景色は、まさに夢のような美しさ',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/寸又峽/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/寸又峽/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/寸又峽/3.jpg")
  ],
  latitude: 43.49342,
  longitude: 142.614019,
  tag_list: '警告,橋,絶景,自然',
  user_id: 4
)

Post.create(
  address: '河口湖',
  description: '湖面に映る美しい逆さ富士が見られる、人気撮影スポット',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/河口湖/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/河口湖/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/河口湖/3.jpg")
  ],
  latitude: 35.517095,
  longitude: 138.751779,
  tag_list: '池,山,絶景,自然',
  user_id: 5
)

Post.create(
  address: '星峠の棚田',
  description: '春、秋になると「水鏡」現象が起こってとても幻想的な姿を現します。',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/星峠の棚田/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/星峠の棚田/2.jpg")
  ],
  latitude: 37.12447,
  longitude: 138.529058,
  tag_list: '田舎,棚田,絶景,自然',
  user_id: 5
)

Post.create(
  address: '鳴沢氷穴',
  description: '大きな氷柱が幻想的に輝き、腰をかがめないと通れない部分もある洞内で、日本にいるとは思えないような不思議な体験をすることができますよ。',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/鳴沢氷穴/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/鳴沢氷穴/2.jpg")
  ],
  latitude: 35.474928,
  longitude: 138.666969,
  tag_list: '絶景,自然',
  user_id: 6
)

Post.create(
  address: '白崎海岸',
  description: '和歌山県のほぼ中央に位置する由良町にある「白崎海岸」は、約2億5000万年前に形成されたといわれています。白い岩は石灰岩で、その景色は日本の“エーゲ海”と称されているほど。',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/白崎海岸/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/白崎海岸/2.jpg")
  ],
  latitude: 33.977005,
  longitude: 135.072327,
  tag_list: '海,絶景,自然',
  user_id: 7
)

30.times do |i|
  Like.create!(
    post_id: 1,
    user_id: i + 1
  )
end

25.times do |i|
  Like.create!(
    post_id: 4,
    user_id: i + 1
  )
end

20.times do |i|
  Like.create!(
    post_id: 7,
    user_id: i + 1
  )
end

15.times do |i|
  Like.create!(
    post_id: 10,
    user_id: i + 1
  )
end

25.times do |i|
  Follow.create!(
    followable_type: 'User',
    followable_id: 1,
    follower_type: 'User',
    follower_id: 2 + i,
    blocked: false
  )
end

20.times do |i|
  Follow.create!(
    followable_type: 'User',
    followable_id: 2 + i,
    follower_type: 'User',
    follower_id: 1,
    blocked: false
  )
end