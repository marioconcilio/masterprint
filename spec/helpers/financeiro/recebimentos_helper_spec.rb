require 'rails_helper'

RSpec.describe Financeiro::RecebimentosHelper, type: :helper do

  context 'process remessa' do

    context 'CBR0603.129' do
      let(:list) { process_remessa('spec/fixtures/recebimentos/CBR0603.129') }

      it 'should include bills' do
        ids = [593, 594001, 594002, 595, 596, 598001, 598002, 598003, 599001, 599002,
          600001, 600002, 600003, 600004, 600005, 600006, 600007, 601001, 601002,
          601003, 604, 605001, 605002, 606]

        array = ids.map { |id| Recebimento.new(id: id) }
        expect(list).to match_array(array)
      end
    end

    context 'CBR1702.128' do
      let(:list) { process_remessa('spec/fixtures/recebimentos/CBR1702.128') }

      it 'should include bills' do
        ids = [572001, 572002, 572003, 572004, 572005, 572006, 572007, 572008,
          572009, 572010, 572011, 572012, 572013, 572014, 572015, 572016, 572017,
          572018, 572019, 572020, 582, 583001, 583002, 584, 585001, 585002, 586,
          587001, 587002, 588, 589001, 589002, 590, 591001, 591002]

        array = ids.map { |id| Recebimento.new(id: id) }
        expect(list).to match_array(array)
      end
    end

  end
end
