require 'rails_helper'

RSpec.describe Recado, type: :model do
  it { should validate_presence_of(:titulo) }
  it { should validate_presence_of(:texto) }
  it { should validate_presence_of(:remetente) }

  it { should belong_to(:remetente).class_name('Usuario') }
  it { should belong_to(:destinatario).class_name('Usuario') }

  context 'when ordering' do
    let!(:recados) { FactoryGirl.create_list(:recado, 4) }
    let(:sorted) { Recado.all }

    before do
      recados[0].update(updated_at: DateTime.now, done: true)
      recados[1].update(updated_at: 1.day.ago)
      recados[2].update(updated_at: DateTime.now)
      recados[3].update(updated_at: 1.day.ago, done: true)
    end

    it 'should put the last updated undone first' do
      expect(sorted.first).to eql(recados[2])
    end

    it 'should put the oldest undone second' do
      expect(sorted.second).to eql(recados[1])
    end

    it 'should put the last updated done second to last' do
      expect(sorted[-2]).to eql(recados[0])
    end

    it 'should put the oldest done last' do
      expect(sorted.last).to eql(recados[3])
    end
  end

end
