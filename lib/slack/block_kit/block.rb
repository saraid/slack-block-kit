# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      attr_reader :block_id

      def block_id=(obj)
        raise TypeError, 'block_id must be a string' unless block_id.respond_to?(:to_str)
        raise RangeError, 'block_id must be max 255 characters' unless block_id.size <= 255

        @block_id = obj.to_s
      end

      def type
        @type ||= self.class.name
          .split('::')
          .last.chomp('Block')
          .gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      end

      def to_h
        { type: type,
          block_id: block_id }
      end
    end
  end
end
