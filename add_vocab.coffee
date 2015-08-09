Commands.create 'add vocab',
  grammarType: 'textCapture'
  description: 'Add the selection to the voicecode settings vocabulary list as a new vocabulary term, specifying the argument as an alternate pronunciation if an argument is given.'
  tags: ['user', 'recognition']
  vocabulary: true
  action: (input) ->
    newVocab = @getSelectedText.call(@)
    @exec 'atom ~/voicecode/commando/config/user_settings.coffee'
    @delay '500'
    @key 'f', 'command'
    if input == null
      @string 'Settings.extend "vocabulary",'
      @key 'Enter'
      @key 'Escape'
      @key 'Right'
      @key 'Enter'
      @key 'Tab'
      @string '\'' + newVocab + '\''
    else
      alternatePronunciation = input.toString()
      @string 'Settings.extend "vocabularyAlternate",'
      @key 'Enter'
      @key 'Escape'
      @key 'Right'
      @key 'Enter'
      @key 'Tab'
      @string '\'' + newVocab + '\': \'' + alternatePronunciation + '\''
