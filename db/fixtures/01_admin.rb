puts 'adminのseed_fu、実行開始。'

Admin.seed_once(:email,
  email: ENV['ADMIN_MAIL'],
  password: ENV['ADMIN_PASS']
)

puts 'adminのseed_fu、実行完了。'