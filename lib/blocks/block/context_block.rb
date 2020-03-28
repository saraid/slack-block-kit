# frozen_string_literal: true

module Slack
  module Messages
    module Blocks
      class Block
        class ContextBlock < Block
          attr_accessor :block_id
          attr_accessor :elements

          def self.[](hash)
            new.tap do |object|
              hash[:elements].each(&object.elements.method(:<<))
              raise ArgumentError, 'invalid ContextBlock' unless object.valid?
            end
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
            ).reject { |_, v| v.nil? || v.empty? }
          end
        end
      end
    end
  end
end
