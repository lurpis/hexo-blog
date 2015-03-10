<div class="wrap">
    <div class="inner">
        <span class="head-title">
            <a class="hvr-buzz-out" href="{{ config.root }}">LURRPIS</a>
        </span>
        {% if theme.menu %}
        <ul class="nav-menu">
        {% for name, path in theme.menu %}
         {% set itemName = name.toLowerCase() %}
            <li>
                <a href="{{ url_for(path) }}" class="hvr-buzz-out">{{ __('menu.' + itemName) }}</a>
            </li>
            {% endfor %}
        </ul>
        {% endif %}
    </div>
</div>