require 'rails_helper'

RSpec.describe ChapaDolar, type: :model do
  it { should validate_presence_of(:value) }
end
