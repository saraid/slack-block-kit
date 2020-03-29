# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class OverflowElement < Element
        using Refinements::HashCompact
        attr_reader :options, :confirm

        def self.populate(hash, object)
          hash[:options].each(&object.options.method(:<<)) if hash.key?(:options)
          object.confirm = hash.fetch(:confirm) if hash[:confirm]

          super(hash, object)
        end

        def initialize
          @options = TypeRestrictedArray.new(CompositionObjects::Option)
        end

        def valid?
          (2..5).include?(options.size)
        end

        def confirm=(obj)
          unless obj.is_a?(CompositionObjects::ConfirmationDialog)
            raise TypeError, 'confirm must be a ConfirmationDialog Object'
          end

          @confirm = obj
        end

        def to_h
          super.merge(
            options: options.map(&:to_h),
            confirm: confirm&.to_h
          ).compact
        end
      end
    end
  end
end
