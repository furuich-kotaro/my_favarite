User.create!(
  name: 'test',
  email: 'test@gmail.com',
  password: 'password'
)

User.create!(
  name: 'test2',
  email: 'test2@gmail.com',
  password: 'password'
)

Post.create!(
  address: '東京タワー',
  description: '実際に自分の足で登ると思い出になるよ',
  pictures: [
              open("#{Rails.root}/app/assets/images/posts/東京タワー/1.jpg"),
              open("#{Rails.root}/app/assets/images/posts/東京タワー/2.jpg")
            ],
  latitude: 35.658581,
  longitude: 139.745433,
  user_id: 1
)

Post.create!(
  address: '渋温泉',
  description: '千と千尋の神隠し」のモデルにもなったといわれる、ノスタルジックな温泉街',
  pictures: [
              open("#{Rails.root}/app/assets/images/posts/渋温泉/1.jpg"),
              open("#{Rails.root}/app/assets/images/posts/渋温泉/2.jpg"),
              open("#{Rails.root}/app/assets/images/posts/渋温泉/2.jpg")
            ],
  latitude: 36.733696,
  longitude: 138.433344,
  user_id: 1
)

Post.create!(
  address: '八方池',
  description: '白馬連峰を映す神秘的な池',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/八方池/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/八方池/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/八方池/2.jpg")
  ],
  latitude: 36.697121,
  longitude: 137.798859,
  user_id: 1
)

Post.create!(
  address: '国営ひたち海浜公園',
  description: '実際に自分の足で登ると思い出になるよ',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/国営ひたち海浜公園/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/国営ひたち海浜公園/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/国営ひたち海浜公園/2.jpg")
  ],
  latitude: 36.40604,
  longitude: 140.598225,
  user_id: 1
)

Post.create!(
  address: '角島大橋',
  description: '青い海と1780mの大橋が作り出す絶景',
  pictures:[
    open("#{Rails.root}/app/assets/images/posts/角島大橋/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/角島大橋/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/角島大橋/2.jpg")
  ],
  latitude: 34.360624,
  longitude: 130.875331,
  user_id: 1
)

Post.create!(
  address: '竜王マウンテンパーク',
  description: '雲海が高確率で楽しめる天空テラス',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/竜王マウンテンパーク/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/竜王マウンテンパーク/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/竜王マウンテンパーク/2.jpg")
  ],
  latitude: 36.783958,
  longitude: 138.456294,
  user_id: 1
)

Post.create!(
  address: '青い池',
  description: '偶然生まれたコバルトブルーの絶景',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/青い池/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/青い池/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/青い池/2.jpg")
  ],
  latitude: 43.49342 ,
  longitude: 142.614019,
  user_id: 2
)

Post.create!(
  address: '寸又峽',
  description: '吊橋から眺める景色は、まさに夢のような美しさ',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/寸又峽/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/寸又峽/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/寸又峽/2.jpg")
  ],
  latitude: 43.49342,
  longitude: 142.614019,
  user_id: 2
)

Post.create!(
  address: '河口湖',
  description: '湖面に映る美しい逆さ富士が見られる、人気撮影スポット',
  pictures: [
    open("#{Rails.root}/app/assets/images/posts/河口湖/1.jpg"),
    open("#{Rails.root}/app/assets/images/posts/河口湖/2.jpg"),
    open("#{Rails.root}/app/assets/images/posts/河口湖/2.jpg")
  ],
  latitude: 35.517095,
  longitude: 138.751779,
  user_id: 2
)
