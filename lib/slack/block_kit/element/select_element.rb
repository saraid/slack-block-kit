# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class SelectElement < Element
        attr_reader :placeholder, :confirm

        def placeholder=(obj)
          raise TypeError, 'placeholder must be a Text Object' unless obj.is_a?(CompositionObjects::Text)
          raise TypeError, 'placeholder must be plain_text' unless obj.type == :plain_text
          raise RangeError, 'placeholder is max 150 characters' unless obj.text.size <= 150

          @placeholder = obj
        end

        def confirm=(obj)
          unless obj.is_a?(CompositionObjects::ConfirmationDialog)
            raise TypeError, 'confirm must be a ConfirmationDialog Object'
          end

          @confirm = obj
        end

        def to_h
          super.merge(
            placeholder: placeholder.to_h,
            confirm: confirm&.to_h
          )
        end
      end
    end
  end
end
