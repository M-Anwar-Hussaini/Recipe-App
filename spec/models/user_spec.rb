require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Pablo', email: 'thasipablo@gmail.com', password: '439_094', password_confirmation: '439_094')
  end

  before { subject.save }

  describe 'Data validation' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Password validation' do
    it 'should have a valid password length' do
      expect(subject).to be_valid
    end

    it 'is not valid with a short password' do
      subject.password = '123'
      expect(subject).to_not be_valid
    end
  end
end
