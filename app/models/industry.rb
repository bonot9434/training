class Industry < ActiveHash::Base

  self.data = [ {id: 0, name: '未選択'},
      {id: 1, name: '金融業界'}, {id: 2, name: '建設・不動産業界'}, {id: 3, name: '運輸・物流業界'},
      {id: 4, name: 'IT業界'}, {id: 5, name: 'マスコミ・メディア・広告業界'}, {id: 6, name: 'エネルギー資源業界'},
      {id: 7, name: '自動車・機械業界'}, {id: 8, name: '電気・精密機械業界'}, {id: 9, name: '食品・飲食業界'},
      {id: 10, name: '生活用品業界'}, {id: 11, name: 'サービス業界'}, {id: 12, name: 'エンタメ・レジャー業界'},
      {id: 13, name: '流通・小売業界'}, {id: 14, name: 'その他'}
      ]

  include ActiveHash::Associations
  has_many :users
end