require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :email }
  end
  describe 'methods' do
    let(:post) { create(:post) }
    let(:user) { create(:user) }
    
    it { is_expected.to respond_to(:owner?, :count_accepted, :count_waiting) }
    describe '.owner?' do
      it 'be false' do
        expect(user.owner? post).to be false
      end
      it 'be true' do
        post.user = user
        post.save
        expect(user.owner? post).to be true
      end
    end
    it 'expect zero accepted posts' do
      post.user = user
      post.save
      expect(user.count_accepted).to eq(0)
      expect(user.count_waiting).to eq(1)  
    end
    it 'expect one accepted posts' do
      post.user = user
      post.accepted!
      expect(user.count_accepted).to eq(1)
      expect(user.count_waiting).to eq(0)  
    end
  end
end
