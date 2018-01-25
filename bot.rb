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
      when 'yes', 'sure', 'yeah', 'yup', 'yah'
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
            },
            {
              content_type: 'text',
              title: 'men',
              payload: 'men'
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
      when 'men'
        message.reply(text: IDIOMS[:men])
      when /\smorning\b/
        message.reply(text: IDIOMS[:morning])
      when /\sfunny\b/
        message.reply(text: IDIOMS[:funny])
      when /\smarry\b/
        message.reply(text: IDIOMS[:marry])
      when /\ssex\b/
        message.reply(text: IDIOMS[:sex])
      when /\sRoss\b/, /\sross\b/
        message.reply(text: IDIOMS[:Ross])
      when /\sRachel\b/, /\srachel\b/
        message.reply(text: IDIOMS[:Rachel])
      when /\sPhoebe\b/, /\sphoebe\b/
        message.reply(text: IDIOMS[:Phoebe])
      when /\sMonica\b/, /\smonica\b/
        message.reply(text: IDIOMS[:Monica])
      when /\sJoey\b/, /\sjoey\b/
        message.reply(text: IDIOMS[:Joey])
      when /\sChandler\b/, /\schandler\b/
        message.reply(text: IDIOMS[:Chandler])
      when /\sjoke\b/
        message.reply(text: IDIOMS[:joke])
      when /\sguess what\b/
        message.reply(text: IDIOMS[:guess_what])
      when /\sthank\b/
        message.reply(text: IDIOMS[:thank])
      when /\sknow\b/
        message.reply(text: IDIOMS[:know])
      when /\shaha\b/ , /\slmao\b/, /\slol\b/, /\sLOL\b/ 
        message.reply(text: IDIOMS[:haha])
      else
        message.reply(text: IDIOMS[:zing].sample)
    end
  end
end


IDIOMS = {
  greeting: "Hi. Name's Chandler. I make jokes when I'm uncomfortable. Want to hear one?",
  love: "Until the age of 25, I thought the only response to 'I love you' was 'oh crap'",
  speed: "It bodes well for me that speed impresses you.",
  zing: ["Can I interest you in a sarcastic comment?", "Do you dig my jokes?", "I can keep going if you'd like.", "What's up?", "Come again?", "Like what you see?", "I’m full, and yet I know if I stop eating this, I’ll regret it.", "I swallow my feelings."],
  morning: "I say more dumb things before 9 am than most people say all day.",
  feel: "We swallow our feelings. Even if it means we're unhappy forever. Sound good?",
  marry: "If you are not careful, you might not get married at all this year.",
  funny: "Well, how you died was funny.",
  sex: "WHOOPAH",
  joke: "You're expecting a joke now?",
  guess_what: "The fifth dentist caved, and now they're all recommending Trident?.",
  duck: "You know what's weird? Donald Duck never wore pants. But whenever he's getting out of the shower he always puts a towel around his waist. I mean, what is that about?",
  thanks: "Why of course.",
  how_are_you: "Pretty good. How are you?",
  men: "If I were a guy...Wait did I just say, if 'I were a guy'?",
  know: "What do you know.",
  haha: "Haha I know I'm funny.",
  Ross: "Oh, no. Two women love me. They're both gorgeous, my wallet's too small for my 50s, and my diamond shoes are too tight.",
  Rachel: "Did you know Ross and Rachel were on a break?",
  Phoebe: "Phoebe's got edge.",
  Joey: "Joey. I miss that guy.",
  Chandler: "Chandler's my name. Don't wear it out.",
  Monica: "What did I marry into when I married Monica."
}


wait_for_user_input