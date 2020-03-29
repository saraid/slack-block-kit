[ SectionBlock[text: Text[mrkdwn: [
    "You have a new request:",
    Bold[Link['google.com', 'Fred Enriquez - Time Off request']]
  ]]],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold['Type:'], 'Paid time off',
      Bold['When:'], 'Aug 10-Aug 13',
      "#{Bold['Hours:']} 16.0 (2 days)",
      "#{Bold['Remaining balance:']} 32.0 hours (4 days)",
      "#{Bold['Comments:']} \"Family in town, going camping!\""
    ]],
    accessory: ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/approvalsNewDevice.png",
      alt_text: "computer thumbnail"
    ]
  ],
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
