require 'rails_helper'

RSpec.describe Papel, type: :model do
  it { should validate_presence_of(:grs) }
  it { should validate_presence_of(:larg) }
  it { should validate_presence_of(:comp) }
  it { should validate_presence_of(:fls) }
  it { should validate_presence_of(:peso) }
  it { should validate_presence_of(:qtde) }

  it { should belong_to(:papel_tipo) }
end
