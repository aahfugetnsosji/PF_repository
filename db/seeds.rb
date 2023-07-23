# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {email: 'kakuriyo@example.com', name: 'かくりよ', password: 'password', profile: '創作怪談を投稿していきます。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'onnen-ga-onnen@example.com', name: 'おんねんがおんねん', profile: '夢はチャリで日本一周', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user3.jpg")},
    {email: 'tokoyo@example.com', name: '常世', password: 'password', profile: '趣味は神社巡り。と愛犬(グレートピレニーズ)をモフること。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user2.jpg")}
  ]
)

Post.create!(
  [
    {title: '【創作怪談】彼岸花', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), body: 'これは、近所の彼岸花が一斉に開花する頃の出来事です。', user_id: users[0].id, region_id: 3 },
    {title: 'まるばつさんかく神社', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), body: 'よく行く神社です。こんなにきれいなのに、地元の人くらいしか訪れないような穴場スポットなんです。', user_id: users[2].id, region_id: 5 },
    {title: '帰省中', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), body: '田舎のじいちゃんち。夜の雰囲気けっこうすごくないですか？', user_id: users[1].id, region_id: 7 }
  ]
)

Tag.create!(
  [
    {name: '写真メイン'},
    {name: '文章メイン'},
    {name: '日常'},
    {name: '旅行'},
    {name: '怪談'},
    {name: '神社'},
    {name: 'お寺'},
    {name: '都会'},
    {name: '田舎'},
    {name: '地元'},
    {name: '観光地'}
  ]
)