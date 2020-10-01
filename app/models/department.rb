class Department < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '営業' },
    { id: 3, name: '営業事務' },
    { id: 4, name: '経理' },
    { id: 5, name: '総務' },
    { id: 6, name: '業務' },
    { id: 7, name: 'その他' },
  ]
  end