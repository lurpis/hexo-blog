{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ __('title.archive') }} - {{ config.title }} {% endblock %}

{% block page_class %} page-archive {% endblock %}

{% block content %}

  <span class="archive-move-on"></span>

  <span class="archive-page-counter">
    {{ _p("counter.archive_posts", site.posts.length) }}
  </span>

  {% for post in page.posts %}

    {# Show year #}
    {% set year %}
    {% set post.year = post.date | date('Y') %}

    {% if post.year !== year %}
      {% set year = post.year %}
      <div class="collection-title">
        <h2 class="archive-year motion-element" id="archive-year-{{ year }}">{{ year }}</h2>
      </div>
    {% endif %}
    {# endshow #}

    {{ render.post(post) }}

  {% endfor %}
{% endblock %}

{% block script_extra %}
  {% if theme.use_motion %}
    <script type="text/javascript">
      $('.archive-year').velocity('transition.slideLeftIn');
    </script>
  {% endif %}
{% endblock %}
