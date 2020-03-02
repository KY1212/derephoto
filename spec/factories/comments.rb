FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    image { nil }
  end
end
