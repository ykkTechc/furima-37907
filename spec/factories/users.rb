FactoryBot.define do
  factory :user do
    nickname              {'ホゲ'}
    email                 {Faker::Internet.free_email}
    password              {'hoge123'}
    password_confirmation {password}
    lastname              { '山田' }
    sub_lastname          { 'ヤマダ' }
    name                  { '悟' }
    sub_name              { 'サトル' }
    birthday              {2020/10/01}
  end
end