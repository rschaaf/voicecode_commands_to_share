Commands.createWithDefaults {triggerScopes: ["Atom"], tags: ["atom", "user"]},
# Miscellaneous
  "lindent":
    description: "indent current line(s)"
    action: ->
      @key "]", "command"
  "loutdent":
    description: "outdent current line(s)"
    action: ->
      @key "[", "command"
  "shackin":
    description: "select all text inside the current brackets"
    action: ->
      @key "m", ["command", "control"]
  "stackle":
    description: "select current word"
    action: ->
      @key "w", ["control", "shift"]
# Multiple Cursors
  "cursall":
    description: "generate new cursors and use them to select all the words in the document that are the same as the one under the current cursor(s)"
    action: ->
      @key "g", ["control", "command"]
  "cursneck":
    description: "generate a new cursor and use it to select the next word in the document that is the same as the currently selected word"
    action: ->
      @key "d", "command"
  "curseep":
    description: "add another cursor above the current cursor"
    action: ->
      @key "Up", ["control", "shift"]
  "cursoom":
    description: "add another cursor below the current cursor"
    action: ->
      @key "Down", ["control", "shift"]
  "curshack":
    description: "convert a multi-line selection into multiple cursors"
    action: ->
      @key "l", ["command", "shift"]
# Bookmarks
  "mookit":
    description: "add/remove bookmark on the current line"
    action: ->
      @key "F2", "command"
  "mookneck":
    description: "move the cursor to the next bookmark"
    action: ->
      @key "F2"
  "mookpreev":
    description: "move the cursor to the previous bookmark"
    action: ->
      @key "F2", "shift"
  "see mooks":
    description: "view all bookmarks"
    vocabulary: true
    action: ->
      @key "F2", "control"
  "toss mooks":
    description: "remove all bookmarks in the current editor"
    vocabulary: true
    action: ->
      @key "F2", ["command", "shift"]
# Folding
  "pleat this":
    description: "fold at the current line"
    vocabulary: true
    action: ->
      @key "[", ["option", "command"]
  "splay this":
    description: "unfold at the current line"
    vocabulary: true
    action: ->
      @key "]", ["option", "command"]
  "pleat all":
    description: "fold all"
    vocabulary: true
    action: ->
      @key "{", ["option", "shift", "command"]
  "splay all":
    description: "unfold all"
    vocabulary: true
    action: ->
      @key "}", ["option", "shift", "command"]
  "pleat at":
    description: "fold at a given indentation level"
    grammarType: "numberCapture"
    vocabulary: true
    action: (input) ->
      @key "k", "command"
      @key input, "command"
  "pleat shack":
    description: "fold the selection"
    vocabulary: true
    action: ->
      @key "f", ["control", "option", "command"]

# Ensures that "shackle" selects the whole line, even if the line is wrapped:
Commands.extend "shackle", ->
  if @currentApplication() is "Atom"
    @key "l", "command"
    @stop()
