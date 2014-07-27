require 'spec_helper'

describe Admin do
  describe 'validations' do
    it { should validate_presence_of :email }
  end
end
