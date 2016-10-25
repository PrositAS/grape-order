require "grape"
require "grape/sort/version"

module Grape
  module Sort
    def self.included(base)
      base.class_eval do
        helpers do
          def sort(collection)
            sorters = params[:sort].split(',').map do |s|
              if s[0] == '-'
                "#{s} asc"
              else
                "#{s} desc"
              end
            end
            collection.tap do |data|
            end
          end
        end

        def self.sort(sorter = '')
          params do
            optional :sort,     type: String, default: (sorter if sorter.present?),
                     desc: 'Set sort order.'
          end
        end
      end
    end
  end
end