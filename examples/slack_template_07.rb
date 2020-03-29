[ SectionBlock[
    text: Text[mrkdwn: "We found #{Bold['205 Hotels']} in New Orleans, LA from #{Bold['12/14 to 12/17']}"],
    accessory: OverflowElement[options: [
      Option[text: Text[plain_text: 'Option One', emoji: true], value: 'value-0'],
      Option[text: Text[plain_text: 'Option Two', emoji: true], value: 'value-1'],
      Option[text: Text[plain_text: 'Option Three', emoji: true], value: 'value-2'],
      Option[text: Text[plain_text: 'Option Four', emoji: true], value: 'value-3'],
    ]]
  ],
  DividerBlock[],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold[Link['fakeLink.toHotelPage.com', 'Windsor Court Hotel']],
      '★★★★★',
      '$340 per night',
      'Rated: 9.4 - Excellent'
    ]],
    accessory: ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/tripAgent_1.png",
      alt_text: "Windsor Court Hotel thumbnail"
    ]
  ],
  ContextBlock[elements: [
    ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/tripAgentLocationMarker.png",
      alt_text: "Location Pin Icon"
    ],
    Text[plain_text: "Location: Central Business District", emoji: true]
  ]],
  DividerBlock[],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold[Link['fakeLink.toHotelPage.com', 'The Ritz-Carlton New Orleans']],
      '★★★★★',
      '$340 per night',
      'Rated: 9.1 - Excellent'
    ]],
    accessory: ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/tripAgent_2.png",
      alt_text: "Ritz-Carlton New Orleans thumbnail"
    ]
  ],
  ContextBlock[elements: [
    ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/tripAgentLocationMarker.png",
      alt_text: "Location Pin Icon"
    ],
    Text[plain_text: "Location: French Quarter", emoji: true]
  ]],
  DividerBlock[],
  SectionBlock[
    text: Text[mrkdwn: [
      Bold[Link['fakeLink.toHotelPage.com', 'Omni Royal Orleans Hotel']],
      '★★★★★',
      '$419 per night',
      'Rated: 8.8 - Excellent'
    ]],
    accessory: ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/tripAgent_3.png",
      alt_text: "Omni Royal Orleans Hotel thumbnail"
    ]
  ],
  ContextBlock[elements: [
    ImageElement[
      image_url: "https://api.slack.com/img/blocks/bkb_template_images/tripAgentLocationMarker.png",
      alt_text: "Location Pin Icon"
    ],
    Text[plain_text: "Location: French Quarter", emoji: true]
  ]],
  DividerBlock[],
  ActionsBlock[elements: [
    ButtonElement[text: Text[plain_text: 'Next 2 Results', emoji: true], value: 'click_me_123']
  ]]
]
