require 'rails_helper'

describe Special, type: :model do
  describe 'validation' do
    it { should belong_to(:comedian) }
  end
end
