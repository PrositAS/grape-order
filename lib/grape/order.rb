require "grape"
require "grape/order/version"

module Grape
  module Order
    def self.included(base)
      base.class_eval do
        helpers do
          def order(collection)
            sorters = params[:order].split(',').map do |s|
              if s[0] == '-'
                "#{s} asc"
              else
                "#{s} desc"
              end
            end
            collection.order(sorters.join(','))
          end
        end

        def self.order(sorter = nil)
          params do
            optional :order,     type: String, default: (sorter if sorter.present?),
                     desc: 'Set sorting order.'
          end
        end
      end
    end
  end
end