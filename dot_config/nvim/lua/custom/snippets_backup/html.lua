local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- {% for %} loop
  s('for', {
    t '{% for ',
    i(1, 'item'),
    t ' in ',
    i(2, 'items'),
    t ' %}',
    t { '', '  ' },
    i(3, 'content'),
    t { '', '{% endfor %}' },
  }),

  -- {% if %} statement
  s('if', {
    t '{% if ',
    i(1, 'condition'),
    t ' %}',
    t { '', '  ' },
    i(2, 'content'),
    t { '', '{% endif %}' },
  }),

  -- {% block %}
  s('block', {
    t '{% block ',
    i(1, 'name'),
    t ' %}',
    t { '', '  ' },
    i(2, 'content'),
    t { '', '{% endblock %}' },
  }),

  -- {{ variable }}
  s('var', {
    t '{{ ',
    i(1, 'variable'),
    t ' }}',
  }),

  -- {% url %}
  s('url', {
    t "{% url '",
    i(1, 'url_name'),
    t "' ",
    i(2, 'args'),
    t ' %}',
  }),

  -- {% load %}
  s('load', {
    t '{% load ',
    i(1, 'template_tag'),
    t ' %}',
  }),
}
