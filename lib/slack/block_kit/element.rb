# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      attr_reader :action_id

      def self.populate(hash, object)
        object.action_id = hash[:action_id] if hash.key?(:action_id)
        raise ArgumentError, "invalid #{name}" unless object.valid?
      end

      def self.[](hash)
        new.tap { |obj| populate(hash, obj) }
      end

      def action_id=(obj)
        raise TypeError, 'action_id must be a string' unless action_id.respond_to?(:to_str)
        raise RangeError, 'action_id must be max 255 characters' unless action_id.size <= 255

        @action_id = obj.to_s
      end

      def type
        @type ||= self.class.name
          .split('::')
          .last.chomp('Element')
          .gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      end

      def valid?
        true
      end

      def to_h
        { type: type,
          action_id: action_id }
      end
    end
  end
end
