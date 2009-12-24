# Encoding: UTF-8

{fileTypes: [],
 foldingStartMarker: 
  /(<(?i:(head|table|tr|div|style|script|ul|ol|form|dl))\b.*?>|{% (block|comment|filter|for|if|ifchanged|ifequal|ifnotequal))/,
 foldingStopMarker: 
  /(<\/(?i:(head|table|tr|div|style|script|ul|ol|form|dl))>|{% (endblock|endblocktrans|endcomment|endfilter|endfor|endif|endifchanged|endifequal|endifnotequal) %})/,
 keyEquivalent: /^~D/,
 name: "HTML (Django)",
 patterns: 
  [{comment: 
     "Since html is valid in Django templates include the html patterns",
    include: "text.html.basic"},
   {begin: /{% comment %}/,
    end: "{% endcomment %}",
    name: "comment.block.django.template"},
   {begin: /{#/, end: "#}", name: "comment.line.django.template"},
   {begin: /{{/, end: "}}", name: "variable.other.django.template"},
   {begin: /({%)/,
    captures: {1 => {name: "entity.other.django.tagbraces"}},
    end: "(%})",
    name: "meta.scope.django.template.tag",
    patterns: 
     [{match: 
        /\b(autoescape|endautoescape|block|endblock|blocktrans|endblocktrans|plural|debug|extends|filter|firstof|for|endfor|if|include|else|endif|ifchanged|endifchanged|ifequal|endifequal|ifnotequal|endifnotequal|load|now|regroup|ssi|spaceless|templatetag|widthratio)\b/,
       name: "keyword.control.django.template"},
      {match: /\b(and|or|not|in|by|as)\b/,
       name: "keyword.operator.django.template"},
      {match: 
        /\|(add|addslashes|capfirst|center|cut|date|default|default_if_none|dictsort|dictsortreversed|divisibleby|escape|filesizeformat|first|fix_ampersands|floatformat|get_digit|join|length|length_is|linebreaks|linebreaksbr|linenumbers|ljust|lower|make_list|phone2numeric|pluralize|pprint|random|removetags|rjust|safe|slice|slugify|stringformat|striptags|time|timesince|title|truncatewords|unordered_list|upper|urlencode|urlize|urlizetrunc|wordcount|wordwrap|yesno)\b/,
       name: "support.function.filter.django"},
      {begin: /'|"/, end: "'|\"", name: "string.other.django.template.tag"},
      {match: /[a-zA-Z_]+/, name: "string.unquoted.django.template.tag"}]}],
 scopeName: "text.html.django",
 uuid: "F4B0A70C-ECF6-4660-BC26-785216E3CF02"}