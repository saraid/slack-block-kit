# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      attr_reader :block_id

      def self.populate(hash, object)
        object.block_id = hash[:block_id] if hash.key?(:block_id)
        raise ArgumentError, "invalid #{name}" unless object.valid?
      end

      def self.[](hash)
        new.tap { |obj| populate(hash, obj) }
      end

      def block_id=(obj)
        raise TypeError, 'block_id must be a string' unless obj.respond_to?(:to_str)
        raise RangeError, 'block_id must be max 255 characters' unless obj.size <= 255

        @block_id = obj.to_s
      end

      def type
        @type ||= self.class.name
          .split('::')
          .last.chomp('Block')
          .gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      end

      def valid?
        true
      end

      def to_h
        { type: type,
          block_id: block_id }
      end
    end
  end
end
