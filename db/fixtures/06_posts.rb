# Post.find_or_create_by!(title: "【創作怪談】彼岸花") do |post|
#   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
#   post.body = 'これは、近所の彼岸花が一斉に開花する頃の出来事です。'
#   post.user = kakuriyo
#   post.region_id = 3
# end

# Post.find_or_create_by!(title: "帰省中") do |post|
#   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
#   post.body = '田舎のじいちゃんち。夜の雰囲気けっこうすごくないですか？'
#   post.user = onnen
#   post.region_id = 5
# end

# Post.find_or_create_by!(title: "まるばつさんかく神社") do |post|
#   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
#   post.body = 'よく行く神社です。こんなにきれいなのに、地元の人くらいしか訪れないような穴場スポットなんです。'
#   post.user = tokoyo
#   post.region_id = 7
# end