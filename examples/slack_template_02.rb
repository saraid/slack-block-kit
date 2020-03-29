require 'slack-ruby-client'
require 'slack-block-kit'

client = Slack::Web::Client.new
client.token = '1234'

include Slack::BlockKit::ExecutionContext

blocks = [
  SectionBlock[text: Text[mrkdwn: [
    "You have a new request:",
    Bold[Link['fakeLink.toEmployeeProfile.com', 'Fred Enriquez - New device request']]
  ]]],
  SectionBlock[fields: [
    Text[mrkdwn: [Bold['Type:'], 'Computer (laptop)']],
    Text[mrkdwn: [Bold['When:'], 'Submitted Aut 10']],
    Text[mrkdwn: [Bold['Last Update:'], 'Mar 10, 2015 (3 years, 5 months)']],
    Text[mrkdwn: [Bold['Reason:'], "All vowel keys aren't working."]],
    Text[mrkdwn: [Bold['Specs:'], '"Cheetah Pro 15" - Fast, really fast"']]
  ]],
  ActionsBlock[elements: [
    ButtonElement[
      text: Text[plain_text: 'Approve', emoji: true],
      style: 'primary', value: 'click_me_123'
    ],
    ButtonElement[
      text: Text[plain_text: 'Deny', emoji: true],
      style: 'danger', value: 'click_me_123'
    ]
  ]]
]

payload = {
  channel: '#general',
  blocks: blocks.map(&:to_h) }

client.chat_postMessage(payload)


