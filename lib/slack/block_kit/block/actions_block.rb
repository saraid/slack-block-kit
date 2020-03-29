# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class ActionsBlock < Block
        using Refinements::HashCompact
        attr_accessor :elements

        def self.populate(hash, object)
          hash[:elements].each(&object.elements.method(:<<))
        end

        def initialize
          @elements = TypeRestrictedArray.new(
            Element::ButtonElement,
            Element::SelectElement,
            Element::OverflowElement,
            Element::DatePickerElement
          )
        end

        def valid?
          !@elements.empty? && @elements.size <= 5
        end

        def to_h
          super.merge(
            elements: elements.map(&:to_h)
          ).compact
        end
      end
    end
  end
end
