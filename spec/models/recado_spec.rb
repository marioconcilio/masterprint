require 'rails_helper'

RSpec.describe Recado, type: :model do
  it { should validate_presence_of(:titulo) }
  it { should validate_presence_of(:texto) }
  it { should validate_presence_of(:remetente) }

  it { should belong_to(:remetente).class_name('Usuario') }
  it { should belong_to(:destinatario).class_name('Usuario') }
end
