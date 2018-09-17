FactoryBot.define do
  factory :ticket do
    request_number {DateTime.now.to_f.to_s.delete('.').to_i.to_s(36)}
  end
end