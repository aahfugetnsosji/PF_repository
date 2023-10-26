puts 'postsのseed_fu、実行開始。'

Post.seed(:id,
  {
    id: 1,
    title: "【創作怪談】彼岸花",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"),
    body: 'これは、近所の彼岸花が一斉に開花する頃の出来事です。',
    user_id: 1,
    region_id: 3
  },
  {
    id: 2,
    title: "帰省中",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"),
    body: '田舎のじいちゃんち。夜の雰囲気けっこうすごくないですか？',
    user_id: 2,
    region_id: 5
  },
  {
    id: 3,
    title: "まるばつさんかく神社",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"),
    body: 'よく行く神社です。こんなにきれいなのに、地元の人くらいしか訪れないような穴場スポットなんです。',
    user_id: 3,
    region_id: 7
  },
  {
    id: 4,
    title: "こう見えて現役",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"),
    body: '夏休み謳歌中〜。じいちゃんちから歩いて20分くらいのとこにあるトンネル。雰囲気えぐくないですか？',
    user_id: 2,
    region_id: 5
  },
  {
    id: 5,
    title: "【○○市観光情報】夏季限定！お化け屋敷開催します",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"),
    body: '7月1日〜8月31日までの期間限定で、市民会館にてお化け屋敷を開催します！○○市出身のお化け屋敷作家▲▲氏に監修いただきました。これまでにない恐怖体験をぜひ！',
    user_id: 5,
    region_id: 4
  },
  {
    id: 6,
    title: "うしろ",
    body: 'うしろにいるとおもったでしょ？',
    user_id: 4,
    region_id: 1
  },
  {
    id: 7,
    title: "初投稿",
    body: 'とりあえず、子どもの頃に祖母から聞いた話でも投下してみます。',
    user_id: 6,
    region_id: 3
  }
)

puts 'postsのseed_fu、実行完了。'