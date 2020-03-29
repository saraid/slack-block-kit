# frozen_string_literal: true

module Slack
  module BlockKit
    module CompositionObjects
      class OptionGroup
        attr_reader :label, :options

        def self.[](hash)
          new.tap do |object|
            object.label = hash.fetch(:label)
            hash[:options].each(&object.options.method(:<<))
          end
        end

        def initialize
          @options = TypeRestrictedArray.new(Option)
        end

        def label=(obj)
          raise TypeError, 'label must be a Text Object' unless obj.is_a?(Text)
          raise RangeError, 'label is max 75 characters' unless obj.text.size <= 75

          @label = obj
        end

        def to_h
          { label: label.to_h,
            options: options.map(&:to_h) }
        end
      end
    end
  end
end
