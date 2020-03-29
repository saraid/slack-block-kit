# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class ContextBlock < Block
        using Refinements::HashCompact
        attr_accessor :elements

        def self.populate(hash, object)
          hash[:elements].each(&object.elements.method(:<<))
        end

        def initialize
          @elements = TypeRestrictedArray.new(Element, CompositionObjects::Text)
        end

        def valid?
          !@elements.empty?
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
