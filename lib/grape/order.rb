require 'grape'
require 'grape/order/version'

module Grape
  module Order # :nodoc:
    extend ActiveSupport::Concern

    included do
      helpers HelperMethods
    end

    module HelperMethods # :nodoc:
      extend Grape::API::Helpers

      def order(collection)
        sorters = params[:order].split(',').map do |s|
          if s[0] == '-'
            "#{s[1..-1]} asc"
          else
            "#{s} desc"
          end
        end
        collection.order(sorters.join(','))
      end
    end

    module DSLMethods # :nodoc:
      def order(sorter = nil)
        params do
          optional :order, type: String, default: (sorter if sorter.present?),
                           desc: 'Set sorting order.'
        end
      end
    end
    Grape::API.const_defined?(:Instance) ? Grape::API::Instance.extend(DSLMethods) : Grape::API.extend(DSLMethods)
  end
end
