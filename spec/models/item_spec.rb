RSpec.describe Item, type: :model do
  it { should have_many(:order_items)}
end
