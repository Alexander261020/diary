require 'rails_helper'

RSpec.describe Chapter, type: :model do
  context 'validations check' do
    it { should validate_presence_of :name }
  end
end
