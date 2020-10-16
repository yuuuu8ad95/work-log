FactoryBot.define do
  factory :user do
    nickname                        { 'HIKARI' }
    email                           { Faker::Internet.free_email }
    password                        { Faker::Internet.password(min_length: 6) }
    password_confirmation           { password }
    first_name                      { '光莉' }
    family_name                     { '山口' }
    first_name_kana                 { 'ヒカリ' }
    family_name_kana                { 'ヤマグチ' }
    department_id                   { 2 }
    birthday                        { Faker::Date.birthday }
    prefecture_id                   { 38 }
    hobby                           { '音楽' }
    free                            { 'よろしくお願いいたします。' }
  end
end
