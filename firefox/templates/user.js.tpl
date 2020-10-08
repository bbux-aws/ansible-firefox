{% for item in firefox.prefs %}
user_pref("{{ item.name }}", {{ ('"%s"' | format(item.value)) if item.value is string else (item.value | lower) }});
{% endfor %}