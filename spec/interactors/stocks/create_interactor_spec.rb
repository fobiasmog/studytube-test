require 'rails_helper'

describe Stocks::CreateInteractor do
  subject { described_class.new(params).call }

  let(:params) { {} }

  context 'when try to create with only name' do
    let(:params) { { name: FFaker::Name.unique.name } }

    it { is_expected.to be_instance_of(Stock) }
    it 'should create new stock' do
      expect { subject }.to change(Stock, :count).by(1)
      expect(Stock.last).to have_attributes(name: params[:name])
    end
  end

  context 'when try to attach/create bearer' do
    let(:params) do
      {
        name: FFaker::Name.unique.name,
        bearer_id: (rand * 10000).to_i,
      }
    end

    context 'when bearer doesnt exists' do
      it 'should create new Bearer' do
        expect { subject }.to change(Bearer, :count).by(1)
      end
    end

    context 'when bearer was found' do
      before do
        Fabricate :bearer, id: params[:bearer_id]
      end

      it 'attach Bearer with :bearer_id' do
        expect { subject }.not_to change(Bearer, :count)
      end

      it do
        is_expected.to have_attributes(
          name: params[:name],
          bearer_id: params[:bearer_id],
        )
      end
    end
  end
end
