<div class="copyright">
  {% set current = date(Date.now(), "YYYY") %}
  &copy; &nbsp; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  {{ current }}
  <i class="fa fa-cogs fa-spin"></i>  powered by <a href="http://hexo.io" target="_blank" class="theme-link">Hexo</a> at next
    <div class="footer_icon">
        <a href="http://www.qiniu.com/" class="hvr-buzz-out" target="_blank"><i class="fa fa-html5"></i></a>
        <a href="http://cdn.console.aliyun.com/" class="hvr-buzz-out" target="_blank"><i class="fa fa-rocket"></i></a>
    <a href="http://www.aliyun.com/" class="hvr-buzz-out" target="_blank"><i class="fa fa-skyatlas"></i></a>
    </div>
</div>

{% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
{% if theme.creative_commons in cc %}
  <div class="cc-license">
    <a href="http://creativecommons.org/licenses/{{ theme.creative_commons }}/4.0" class="cc-opacity" target="_blank">
      <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
    </a>
  </div>
{% endif %}

{% block footer %}{% endblock %}