puts 'tagsのseed_fu、実行開始。'

Tag.seed(:id,
  [
    { id: 1, name: '写真メイン' },
    { id: 2, name: '文章メイン' },
    { id: 3, name: '投稿許可確認済み' },
    { id: 4, name: '閲覧注意' },
    { id: 5, name: '創作' },
    { id: 6, name: '実体験' },
    { id: 7, name: '日常' },
    { id: 8, name: '旅行' },
    { id: 9, name: '怪談' },
    { id: 10, name: '民間伝承' },
    { id: 11, name: '神社' },
    { id: 12, name: 'お寺' },
    { id: 13, name: '都会' },
    { id: 14, name: '田舎' },
    { id: 15, name: '地元' },
    { id: 16, name: '観光地' }
  ]
)

puts 'tagsのseed_fu、実行完了。'