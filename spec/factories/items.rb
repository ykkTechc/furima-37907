FactoryBot.define do
  factory :item do
    title            {'テスト'}
    explanation      {'商品の説明'}
    category_id      {2}
    status_id        {2}
    shipping_fee_id  {2}
    prefecture_id    {2}
    send_day_id      {2}
    price            {'1000'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
