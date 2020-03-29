# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class UsersSelectElement < SelectElement
        using Refinements::HashCompact
        attr_accessor :initial_user

        def self.populate(hash, object)
          object.initial_user = hash[:initial_user] if hash.key?(:initial_user)

          super(hash, object)
        end

        def to_h
          super.merge(
            initial_user: initial_user
          ).compact
        end
      end
    end
  end
end
