# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class ActionsBlock < Block
        attr_accessor :elements

        def self.[](hash)
          new.tap do |object|
            hash[:elements].each(&object.elements.method(:<<))
            raise ArgumentError, 'invalid ActionsBlock' unless object.valid?

            object.block_id = hash[:block_id] if hash.key?(:block_id)
          end
        end

        def initialize
          @elements = TypeRestrictedArray.new(
            Element::ButtonElement,
            Element::SelectElement,
            Element::OverflowElement,
            #Element::DatePickerElement,
            CompositionObjects::Text
          )
        end

        def valid?
          !@elements.empty? && @elements.size <= 5
        end

        def to_h
          super.merge(
            elements: elements.map(&:to_h)
          ).reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
