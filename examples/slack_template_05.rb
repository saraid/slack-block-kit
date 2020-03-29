require 'slack-ruby-client'
require 'slack-block-kit'

client = Slack::Web::Client.new
client.token = '1234'

include Slack::BlockKit::ExecutionContext

blocks = [
  SectionBlock[text: Text[mrkdwn: 'Hi David :wave:']],
  SectionBlock[text: Text[mrkdwn: "Great to see you here! App helps you to stay up-to-date with your meetings and events right here within Slack. These are just a few things which you will be able to do:"]],
  SectionBlock[text: Text[mrkdwn: [
    "• Schedule meetings",
    "• Manage and update attendees",
    "• Get notified about changes of your meetings"
  ]]],
  SectionBlock[text: Text[mrkdwn: "But before you can do all these amazing things, we need you to connect your calendar to App. Simply click the button below:"]],
  ActionsBlock[elements: [
    ButtonElement[text: Text[plain_text: 'Connect account', emoji: true], value: 'click_me_123']
  ]]
]

payload = {
  channel: '#general',
  blocks: blocks.map(&:to_h) }

client.chat_postMessage(payload)
