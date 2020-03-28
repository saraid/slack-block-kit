require 'slack-ruby-client'
require 'slack-block-kit'

client = Slack::Web::Client.new
client.token = '1234'

include Slack::BlockKit::ExecutionContext

blocks =
  [ SectionBlock[text: Text[mrkdwn: [
      "Hello, Assistant to the Regional Manager Dwight! #{Bold['Michael Scott']} wants to know where you'd like to take the Paper Company investors to dinner tonight.",
      nil,
      Bold['Please select a restaurant:']
    ]]],
    DividerBlock[],
    SectionBlock[
      text: Text[mrkdwn: [
        Bold['Farmhouse Thai Cuisine'],
        ':star::star::star::star: 1528 reviews',
        'They do have some vegan options, like the roti and curry, plus they have a ton of salad stuff and noodles can be ordered without meat!! They have something for everyone here'
      ]],
      accessory: ImageElement[
				image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/c7ed05m9lC2EmA3Aruue7A/o.jpg",
				alt_text: "alt text for image"
			]
    ],
    SectionBlock[
      text: Text[mrkdwn: [
				Bold['Kin Khao'],
        ':star::star::star::star: 1638 reviews',
        'The sticky rice also goes wonderfully with the caramelized pork belly, which is absolutely melt-in-your-mouth and so soft.'
      ]],
      accessory: ImageElement[
				image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/korel-1YjNtFtJlMTaC26A/o.jpg",
				alt_text: "alt text for image"
			]
		],
    SectionBlock[
      text: Text[mrkdwn: [
        Bold['Ler Ros'],
        ':star::star::star::star: 2082 reviews',
        'I would really recommend the  Yum Koh Moo Yang - Spicy lime dressing and roasted quick marinated pork shoulder, basil leaves, chili & rice powder.'
      ]],
			accessory: ImageElement[
				image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/DawwNigKJ2ckPeDeDM7jAg/o.jpg",
				alt_text: "alt text for image"
			]
		],
    DividerBlock[],
    ActionsBlock[elements: [
      ButtonElement[text: Text[plain_text: 'Farmhouse', emoji: true], value: 'click_me_123'],
      ButtonElement[text: Text[plain_text: 'Kin Khao', emoji: true], value: 'click_me_123'],
      ButtonElement[text: Text[plain_text: 'Ler Ros', emoji: true], value: 'click_me_123']
    ]]
  ]

payload = {
  channel: '#general',
  blocks: template.map(&:to_h) }

client.chat_postMessage(payload)

