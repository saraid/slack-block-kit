[ SectionBlock[text: Text[mrkdwn: [
    "Hey there :wave: I'm TaskBot. I'm here to help you create and manage tasks in Slack.",
    "There are two ways to quickly create tasks:"
  ]]],
  SectionBlock[text: Text[mrkdwn: [
    "#{Bold[":one: Use the #{Code['/task']} command"]}. Type #{Code['/task']} followed by a short description of your tasks and I'll ask for a due date (if applicable). Try it out by using the #{Code['/task']} command in this channel."
  ]]],
  SectionBlock[text: Text[mrkdwn: [
    "#{Bold[":two: Use the #{Italic['Create a Task']} action."]} If you want to create a task from a message, select #{Code['Create a Task']} in a message's context menu. Try it out by selecting the #{Italic['Create a Task']} action for this message (shown below)."
  ]]],
  ImageBlock[
    title: Text[plain_text: "image1", emoji: true],
    image_url: "https://api.slack.com/img/blocks/bkb_template_images/onboardingComplex.jpg",
    alt_text: "image1"
  ],
  SectionBlock[
    text: Text[mrkdwn: ":heavy_plus_sign: To start tracking your team's tasks, #{Bold['add me to a channel']} and I'll introduce myself. I'm usually added to a team or project channel. Type #{Code['/invite @TaskBot']} from the channel or pick a channel on the right."],
    accessory: ConversationsSelectElement[
      placeholder: Text[plain_text: 'Select a channel...', emoji: true]
    ]
  ],
  DividerBlock[],
  ContextBlock[elements: [
    Text[mrkdwn: [
      ":eyes: View all tasks with #{Code['/task list']}",
      ":question: Get help at any time with #{Code['/task help']} or type #{Bold['help']} in a DM with me"
    ]]
  ]]
]
