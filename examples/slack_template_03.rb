[ SectionBlock[
    text: Text[plain_text: 'Looks like you have a scheduling conflict with this event:', emoji: true]
  ],
  DividerBlock[],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold[Link['fakeLink.toUserProfiles.com', 'Iris / Zelda 1-1']],
      "Tuesday, January 21 4:00-4:30pm",
      "Building 2 - Havarti Cheese (3)",
      "2 guests"
    ]],
    accessory: ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/notifications.png",
      alt_text: "calendar thumbnail"
    ]
  ],
  ContextBlock[elements: [
    ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/notificationsWarningIcon.png",
      alt_text: "notifications warning icon"
    ],
    Text[mrkdwn: Bold["Conflicts with Team Huddle: 4:15-4:30pm"]]
  ]],
  DividerBlock[],
  SectionBlock[text: Text[mrkdwn: Bold['Propose a new time:']]],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold['Today - 4:30-5pm'],
      "Everyone is available: @iris, @zelda"
    ]],
    accessory: ButtonElement[
      text: Text[plain_text: "Choose", emoji: true],
      value: "click_me_123"
    ]
  ],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold['Tomorrow - 4-4:30pm'],
      "Everyone is available: @iris, @zelda"
    ]],
    accessory: ButtonElement[
      text: Text[plain_text: "Choose", emoji: true],
      value: "click_me_123"
    ]
  ],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold['Tomorrow - 6-6:30pm'],
      "Some people aren't available: @iris, #{Strike['@zelda']}"
    ]],
    accessory: ButtonElement[
      text: Text[plain_text: "Choose", emoji: true],
      value: "click_me_123"
    ]
  ],
  SectionBlock[text: Text[mrkdwn: Bold[Link['fakelink.ToMoreTimes.com', 'Show more times']]]]
]
