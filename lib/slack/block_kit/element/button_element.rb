# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ButtonElement < Element
        attr_reader :text
        attr_accessor :action_id, :value, :style

        def self.[](hash)
          new.tap do |object|
            object.text = hash.fetch(:text)
            object.action_id = hash.fetch(:action_id) if hash[:action_id]
            object.value = hash.fetch(:value) if hash[:value]
          end
        end

        def valid?
          !@text.empty?
        end

        def text=(obj)
          raise TypeError, 'text must be a Text Object' unless obj.is_a?(CompositionObjects::Text)

          @text = obj
        end

        def to_h
          super.merge(
            text: text.to_h,
            action_id: action_id,
            style: style,
            value: value
          ).compact
        end
      end
    end
  end
end
