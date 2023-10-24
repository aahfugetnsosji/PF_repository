puts 'usersのseed_fu、実行開始。'

User.seed(:email,
  {
    id: 1,
    name: '幽世',
    email: 'kakuriyo@example.com',
    password: 'password',
    profile: '創作怪談を投稿していきます。',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  },
  {
    id: 2,
    name: 'おんねんがおんねん',
    email: 'onnen-ga-onnen@example.com',
    password: 'password',
    profile: '夢はチャリで日本一周',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
  },
  {
    id: 3,
    name: '常世',
    email: 'tokoyo@example.com',
    password: 'password',
    profile: '趣味は神社巡り。と愛犬(グレートピレニーズ)をモフること。',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
  },
  {
    id: 4,
    name: 'サヨ子',
    email: 'sayoko@example.com',
    password: 'password',
    profile: '京都行きたい。'
  },
  {
    id: 5,
    name: '虚友達',
    email: 'imaginary-friend@example.com',
    password: 'password',
    profile: 'みんなほんとに見えないの？'
  }
)

puts 'usersのseed_fu、実行完了。'