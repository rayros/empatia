# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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
