require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Salad', measurement_unit: 'g', price: 3) }
  before { subject.save }

  describe 'Data validation' do
    it 'Should have a valid name' do
      subject.name = 'Salad'
      expect(subject).to be_valid
    end

    it 'Should have a valid measurement_unit' do
      expect(subject.measurement_unit).to eq('g')
    end

    it 'Should have a valid numerical price value' do
      expect(subject.price).to be_integer
    end
  end
end
