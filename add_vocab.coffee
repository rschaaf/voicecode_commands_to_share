Commands.create 'add vocab',
	grammarType: 'textCapture'
  description: 'Add a new vocabulary term to the voicecode settings vocabulary list, specifying as an alternate pronunciation any argument given.'
	tags: ['user', 'recognition']
	vocabulary: true
  action: (input) ->
    newVocab = @getSelectedText.call(@)
    @exec 'atom ~/voicecode/commando/config/user_settings.coffee'
    @key 'f', 'command'
    alternatePronunciation = input.toString()
    if alternatePronunciation = 'NaN'
      @string 'Settings.extend "vocabulary",'
      @key 'escape'
      @key 'right'
      @key 'enter'
      @string '\'' + newVocab + '\''
    else
      @string 'Settings.extend "vocabularyAlternate",'
      @key 'escape'
      @key 'right'
      @key 'enter'
      @string '\'' + newVocab + '\': \'' + alternatePronunciation + '\''
