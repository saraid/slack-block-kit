# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class DatePickerElement < Element
        using Refinements::HashCompact
        attr_reader :initial_date, :placeholder, :confirm

        def self.populate(hash, object)
          object.placeholder = hash.fetch(:placeholder) if hash[:placeholder]
          object.confirm = hash.fetch(:confirm) if hash[:confirm]
          object.initial_date = hash.fetch(:initial_date) if hash[:initial_date]

          super(hash, object)
        end

        def type
          'datepicker'
        end

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

        def initial_date=(date)
          date = date.strftime('%Y-%m-%d') if date.is_a?(Time)
          raise TypeError, 'initial_date must be a string' unless date.respond_to?(:to_str)
          raise TypeError, 'initial_date must be YYYY-MM-DD' unless date.match?(/\d{4}-\d{2}-\d{2}/)

          @initial_date = date.to_s
        end

        def to_h
          super.merge(
            initial_date: initial_date,
            placeholder: placeholder&.to_h,
            confirm: confirm&.to_h
          ).compact
        end
      end
    end
  end
end
