# frozen_string_literal: true

module Slack
  module BlockKit
    module CompositionObjects
      class ConfirmationDialog
        attr_reader :title, :text, :confirm, :deny

        def self.[](hash)
          new.tap do |object|
            object.title = hash[:title] if hash.key?(:title)
            object.text = hash[:text] if hash.key?(:text)
            object.confirm = hash[:confirm] if hash.key?(:confirm)
            object.deny = hash[:deny] if hash.key?(:deny)
          end
        end

        def title=(obj)
          raise TypeError, 'title must be a Text Object' unless obj.is_a?(Text)
          raise TypeError, 'title must be plain_text' unless obj.type == :plain_text
          raise RangeError, 'title is max 100 characters' unless obj.text.size <= 100

          @title = obj
        end

        def text=(obj)
          raise TypeError, 'text must be a Text Object' unless obj.is_a?(Text)
          raise RangeError, 'text is max 300 characters' unless obj.text.size <= 300

          @text = obj
        end

        def confirm=(obj)
          raise TypeError, 'confirm must be a Text Object' unless obj.is_a?(Text)
          raise TypeError, 'confirm must be plain_text' unless obj.type == :plain_text
          raise RangeError, 'confirm is max 30 characters' unless obj.text.size <= 30

          @confirm = obj
        end

        def deny=(obj)
          raise TypeError, 'deny must be a Text Object' unless obj.is_a?(Text)
          raise TypeError, 'deny must be plain_text' unless obj.type == :plain_text
          raise RangeError, 'deny is max 30 characters' unless obj.text.size <= 30

          @deny = obj
        end

        def to_h
          { title: title.to_h,
            text: text.to_h,
            confirm: confirm.to_h,
            deny: deny.to_h }.reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
