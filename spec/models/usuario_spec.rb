require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { should have_secure_password }

  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:usuario) }
  it { should validate_presence_of(:password) }

  it { should validate_length_of(:usuario).is_at_most(50) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should validate_uniqueness_of(:usuario).ignoring_case_sensitivity }
end
