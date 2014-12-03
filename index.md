---
layout: default
---
# MạnhTài.vn
---

<article>
{% for post in site.posts %}
<p>&raquo; 
<a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
{% if post.converted %}
<span style="float: right"><a href="{{ post.path | remove_first: '_posts/' | replace_first: '.md', '.Rmd' | prepend: "//raw.githubusercontent.com/manhtai/blog/gh-pages/_knitr/" }}" title="Rmd file" target="_blank">[code]</a>
</span>
{% endif %}
</p>
{% endfor %}
</article>

---
