# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ButtonElement < Element
        using Refinements::HashCompact
        attr_reader :text, :style
        attr_accessor :value

        def self.populate(hash, object)
          object.text = hash.fetch(:text)
          object.action_id = hash.fetch(:action_id) if hash[:action_id]
          object.style = hash.fetch(:style) if hash[:style]
          object.value = hash.fetch(:value) if hash[:value]

          super(hash, object)
        end

        def valid?
          !@text.empty?
        end

        def text=(obj)
          raise TypeError, 'text must be a Text Object' unless obj.is_a?(CompositionObjects::Text)

          @text = obj
        end

        def style=(obj)
          unless %i( default primary danger ).include?(obj.to_sym)
            raise ArgumentError, 'style may only be default, primary, or danger'
          end

          @style = obj.to_sym
        end

        def to_h
          super.merge(
            text: text.to_h,
            style: style,
            value: value
          ).compact
        end
      end
    end
  end
end
