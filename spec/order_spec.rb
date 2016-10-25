require 'spec_helper'
require 'pry'

class UnOrderedAPI < Grape::API
  # Intentionally not including Grape::Order
end

class OrderedAPI < Grape::API
  include Grape::Order
end

describe Grape::Order do

  describe 'unordered api' do
    subject { Class.new(UnOrderedAPI) }

    it 'raises an error' do
      expect { subject.order }.to raise_error(NoMethodError, /undefined method `order' for/i)
    end
  end

  describe 'default ordered api' do
    subject { Class.new(OrderedAPI) }

    it 'adds to declared parameters' do
      subject.order
      if Grape::Order.post_0_9_0_grape?
        expect(subject.inheritable_setting.route[:declared_params]).to eq([:order])
      else
        expect(subject.settings[:declared_params]).to eq([:order])
      end
    end

    describe 'descriptions, validation, and defaults' do
      before do
        subject.order
        subject.get '/' do; end
      end
      let(:params) {subject.routes.first.route_params}

      it 'does not require :order' do
        expect(params['order'][:required]).to eq(false)
      end

      it 'describes :order' do
        expect(params['order'][:desc]).to eq('Set sorting order.')
      end

      it 'validates :order as String' do
        expect(params['order'][:type]).to eq('String')
      end

      it 'defaults :order to nil' do
        expect(params['order'][:default]).to eq(nil)
      end
    end
  end
end