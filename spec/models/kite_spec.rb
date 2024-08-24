require 'rails_helper'

RSpec.describe Kite, type: :model do
  let(:user) { create(:user) }
  let(:kite) { build(:kite, user:) }

  before(:each) do
    user
    kite
  end

  describe 'check the kite model valid' do
    it 'kite is valid or not?' do
      kite.valid? == true
    end
  end

  describe 'check the association' do
    it 'check the assocaition with kite' do
      kite = Kite.reflect_on_association(:user)
      expect(kite.macro).to eq(:belongs_to)
    end
  end

  describe 'should check owner_name while create the kite' do
    it 'sholud not able to create the kite without owner_name' do
      kite = Kite.create(owner_name: '', nubmer_of_kites: '3', user_id: user.id)
      expect(kite).not_to be_valid
      expect(Kite.count).to eq(0)
    end

    it 'sholud able to create the kite with owner_name' do
      kite = Kite.create(owner_name: 'kk', nubmer_of_kites: '3', user_id: user.id)
      expect(kite).to be_valid
      expect(Kite.count).to eq(1)
    end
  end

  describe 'should check nubmer_of_kites while create the kite' do
    it 'sholud not able to create the kite without nubmer_of_kites' do
      kite = Kite.create(owner_name: 'kk', nubmer_of_kites: '', user_id: user.id)
      expect(kite).not_to be_valid
      expect(Kite.count).to eq(0)
    end

    it 'sholud able to create the kite with nubmer_of_kites' do
      kite = Kite.create(owner_name: 'kk', nubmer_of_kites: '2', user_id: user.id)
      expect(kite).to be_valid
      expect(Kite.count).to eq(1)
    end
  end
end
