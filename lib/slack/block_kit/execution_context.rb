# frozen_string_literal: true

module Slack
  module BlockKit
    # TO USE:
    # include Slack::Messages::Blocks::ExecutionContext
    # data = [ SectionBlock[text: Text[mrkdwn: 'wheeee']] ]
    # Slack::Messages::Blocks::ExecutionContext.test(data)
    # => {
    #      "blocks": [
    #        {
    #          "type": "section",
    #          "text": {
    #            "type": "mrkdwn",
    #            "text": "wheeee"
    #          }
    #        }
    #      ]
    #    }
    # This can be copied and pasted into https://api.slack.com/tools/block-kit-builder
    module ExecutionContext
      ActionsBlock = Block::ActionsBlock
      SectionBlock = Block::SectionBlock
      ContextBlock = Block::ContextBlock
      DividerBlock = Block::DividerBlock
      Text = CompositionObjects::Text

      ButtonElement = Element::ButtonElement
      ImageElement = Element::ImageElement

      Bold = proc { |string| "*#{string}*" }
      Italic = proc { |string| "_#{string}_" }
      Strike = proc { |string| "~#{string}~" }
      Code = proc { |string| "`#{string}`" }
      Link = proc { |link, label = nil| label.nil? || label.empty? ? "<#{link}|#{label}>" : link }

      def self.test(data)
        require 'json'
        puts(JSON.pretty_generate(data.map(&:to_h).yield_self { |h| { blocks: h } }))
      end
    end
  end
end
