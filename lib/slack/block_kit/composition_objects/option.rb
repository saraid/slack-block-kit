# frozen_string_literal: true

module Slack
  module BlockKit
    module CompositionObjects
      class Option
        attr_reader :text, :value, :description, :url

        def self.[](hash)
          new.tap do |object|
            object.text = hash.fetch(:text)
            object.value = hash.fetch(:value)
            object.description = hash[:description] if hash.key?(:description)
            object.url = hash[:url] if hash.key?(:url)
          end
        end

        def text=(obj)
          raise TypeError, 'text must be a Text Object' unless obj.is_a?(Text)
          raise RangeError, 'text is max 75 characters' unless obj.text.size <= 75

          @text = obj
        end

        def value=(obj)
          raise TypeError, 'value must be a string' unless obj.respond_to?(:to_str)
          raise RangeError, 'value is max 75 characters' unless obj.size <= 75

          @value = obj.to_s
        end

        def description=(obj)
          raise TypeError, 'description must be a Text Object' unless obj.is_a?(Text)
          raise TypeError, 'description must be plain_text' unless obj.type == :plain_text
          raise RangeError, 'description is max 75 characters' unless obj.text.size <= 75

          @description = obj
        end

        def url=(obj)
          raise TypeError, 'url must be a string' unless url.respond_to?(:to_str)
          raise RangeError, 'url is max 3000 characters' unless url.size <= 3000

          @url = url.to_s
        end

        def to_h
          { text: text.to_h,
            value: value,
            description: description&.to_h,
            url: url }.reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
