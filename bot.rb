require 'facebook/messenger'
include Facebook::Messenger
# NOTE: ENV variables should be set directly in terminal for testing on localhost
 
# Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
 
def wait_for_user_input
  Bot.on :message do |message|
    message.mark_seen
    puts "Received '#{message.inspect}' from #{message.sender}" 
    message.typing_on
    case message.text
      when "Hi", "hi", "hey", "Hey", "Yo", "yo", "hello"
        message.reply(text: IDIOMS[:greeting],
          quick_replies: [
            {
              content_type: 'text',
              title: 'yes',
              payload: 'yes'
            }
          ]
        )
      when 'yes'
        message.reply(text: 'Alright, pick a category.',
          quick_replies: [
            {
              content_type: 'text',
              title: 'love',
              payload: 'love'
            },
            {
              content_type: 'text',
              title: 'speed',
              payload: 'speed'
            },
            {
              content_type: 'text',
              title: 'duck',
              payload: 'duck'
            }
          ]
        )
      when "How are you?", "how are you", "how are you?", "how r u", "how r u?"
        message.reply(text: IDIOMS[:how_are_you])
      when 'love'
        message.reply(text: IDIOMS[:love])
      when 'speed'
        message.reply(text: IDIOMS[:speed])
      when 'duck'
        message.reply(text: IDIOMS[:duck])
      when /\smorning\b/
        message.reply(text: IDIOMS[:morning])
      when /\smarry\b/
        message.reply(text: IDIOMS[:marry])
      when /\ssex\b/
        message.reply(text: IDIOMS[:sex])
      when /\sjoke\b/
        message.reply(text: IDIOMS[:joke])
      when /\sguess what\b/
        message.reply(text: IDIOMS[:guess_what])
      when /\sthank\b/
        message.reply(text: IDIOMS[:thank])
      else
        message.reply(text: IDIOMS[:zing])
    end
  end
end


IDIOMS = {
  greeting: "Hi. Name's Chandler. I make jokes when I'm uncomfortable. Want to hear one?",
  love: "Until the age of 25, I thought the only response to 'I love you' was 'oh crap'",
  speed: "It bodes well for me that speed impresses you.",
  zing: "Can I interested you in a sarcastic comment?",
  morning: "I say more dumb things before 9 am than most people say all day.",
  feel: "We swallow our feelings. Even if it means we're unhappy forever. Sound good?",
  marry: "If you are not careful, you might not get married at all this year.",
  sex: "WHOOPAH",
  joke: "You're expecting a joke now?",
  guess_what: "The fifth dentist caved, and now they're all recommending Trident?.",
  duck: "You know what's weird? Donald Duck never wore pants. But whenever he's getting otu of the shower he always puts a towel around his waist. I mean, what is that about?",
  thanks: "Why of course.",
  how_are_you: "Pretty good. How are you?"
}


wait_for_user_input