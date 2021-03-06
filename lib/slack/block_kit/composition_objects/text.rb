# frozen_string_literal: true

module Slack
  module BlockKit
    module CompositionObjects
      class Text
        using Refinements::HashCompact
        attr_reader :type, :text, :emoji, :verbatim

        PLAINTEXT = :plain_text
        MRKDWN = :mrkdwn
        NEWLINE = "\n"

        def self.[](hash)
          new.tap do |object|
            object.type = hash.keys.find { |key| [PLAINTEXT, MRKDWN].include?(key) }
            raise ArgumentError, 'type must be `plain_text` or `mrkdwn`' unless object.type

            object.text = hash[object.type]
            object.emoji! if hash[:emoji]
            object.verbatim! if hash[:verbatim]
          end
        end

        def empty?
          text&.empty?
        end

        def emoji!
          @emoji = true
        end

        def verbatim!
          @verbatim = true
        end

        def type=(type)
          unless [PLAINTEXT, MRKDWN].include?(type.to_sym)
            raise ArgumentError, 'type must be `plain_text` or `mrkdwn`'
          end

          @type = type.to_sym
        end

        def text=(text)
          text = text.join(NEWLINE) if text.is_a?(Array)
          raise TypeError, 'text must be a string' unless text.respond_to?(:to_str)

          @text = text.to_s
        end

        def to_h
          { type: type,
            text: text,
            emoji: emoji,
            verbatim: verbatim }.compact
        end
      end
    end
  end
end
