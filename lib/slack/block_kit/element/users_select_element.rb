# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class UsersSelectElement < SelectElement
        attr_accessor :initial_user

        def self.[](hash)
          new.tap do |object|
            object.initial_user = hash[:initial_user] if hash.key?(:initial_user)

            object.placeholder = hash.fetch(:placeholder)
            object.confirm = hash[:confirm] if hash.key?(:confirm)

            object.action_id = hash[:action_id] if hash.key?(:action_id)
            raise ArgumentError, 'invalid UsersSelectElement' unless object.valid?
          end
        end

        def to_h
          super.merge(
            initial_user: initial_user
          ).reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
