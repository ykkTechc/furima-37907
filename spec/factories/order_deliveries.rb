FactoryBot.define do
  factory :order_delivery do
    post           {'123-4567'}
    prefecture_id  {2}
    town           {'まち'}
    address        {'ホゲ市フガ村'}
    building       {'ホゲフガビル'}
    tele_number    {'08012345678'}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
