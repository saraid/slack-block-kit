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
      ContextBlock = Block::ContextBlock
      DividerBlock = Block::DividerBlock
      ImageBlock = Block::ImageBlock
      SectionBlock = Block::SectionBlock

      ConfirmationDialog = CompositionObjects::ConfirmationDialog
      Filter = CompositionObjects::Filter
      Option = CompositionObjects::Option
      OptionGroup = CompositionObjects::OptionGroup
      Text = CompositionObjects::Text

      ButtonElement = Element::ButtonElement
      DatePickerElement = Element::DatePickerElement
      ImageElement = Element::ImageElement
      OverflowElement = Element::OverflowElement

      ConversationsSelectElement = Element::ConversationsSelectElement
      ChannelsSelectElement = Element::ChannelsSelectElement
      ExternalSelectElement = Element::ExternalSelectElement
      StaticSelectElement = Element::StaticSelectElement
      UsersSelectElement = Element::UsersSelectElement

      MultiConversationsSelectElement = Element::MultiConversationsSelectElement
      MultiChannelsSelectElement = Element::MultiChannelsSelectElement
      MultiExternalSelectElement = Element::MultiExternalSelectElement
      MultiStaticSelectElement = Element::MultiStaticSelectElement
      MultiUsersSelectElement = Element::MultiUsersSelectElement

      Bold = proc { |string| "*#{string}*" }
      Italic = proc { |string| "_#{string}_" }
      Strike = proc { |string| "~#{string}~" }
      Code = proc { |string| "`#{string}`" }
      Link = proc { |link, label = nil| label.nil? || label.empty? ? link : "<#{link}|#{label}>" }
      Emoji = proc { |string| ":#{string}:" }
      CodeBlock = proc { |&block| [ '```', yield, '```' ].join(Text::NEWLINE) }
    end
  end
end
