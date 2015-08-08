Commands.create 'add vocab',
	grammarType: 'textCapture'
  description: 'Add the selection to the voicecode settings vocabulary list as a new vocabulary term, specifying the argument as an alternate pronunciation if an argument is given.'
	tags: ['user', 'recognition']
	vocabulary: true
  action: (input) ->
    newVocab = @getSelectedText.call(@)
    @exec 'atom ~/voicecode/commando/config/user_settings.coffee'
    @key 'f', 'command'
    alternatePronunciation = input.toString()
    if alternatePronunciation == 'NaN'
      @string 'Settings.extend "vocabulary",'
      @key 'enter'
			@key 'escape'
      @key 'right'
      @key 'enter'
			@key 'tab'
      @string '\'' + newVocab + '\''
    else
      @string 'Settings.extend "vocabularyAlternate",'
      @key 'enter'
      @key 'escape'
      @key 'right'
      @key 'enter'
			@key 'tab'
      @string '\'' + newVocab + '\': \'' + alternatePronunciation + '\''
