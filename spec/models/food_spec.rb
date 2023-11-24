require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Salad', measurement_unit: 'g', price: 3) }
  before { subject.save }

  describe 'Data validation' do
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a measurement unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end
end
