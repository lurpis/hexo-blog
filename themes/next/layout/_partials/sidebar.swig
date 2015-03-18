
<div class="sidebar-toggle">
  <div class="sidebar-toggle-line-wrap">
    <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
    <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
    <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
  </div>
</div>

<div id="sidebar" class="sidebar">
  <div class="sidebar-inner">

    {% if is_post() %}
      <ul class="sidebar-nav motion-element">
        <li class="sidebar-nav-overview" data-target="site-overview">{{ __('sidebar.overview') }}</li>
        <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc">{{ __('sidebar.toc') }}</li>
      </ul>
    {% endif %}

    <div class="site-overview">
      <div class="site-author motion-element">
        <img class="site-author-image" src="{{ theme.avatar || '/images/default_avatar.png' }}" alt="{{ theme.author }}" />
        <p class="site-author-name">{{ theme.author }}<a href="/atom.xml" class="hvr-buzz-out" target="_blank"><i class="fa fa-rss"></i></a></p>
      </div>
      <p class="site-description motion-element">{{ theme.introduce }}</p>
      <div class="site-state motion-element">
        <div class="site-state-item site-state-posts">
          <span class="site-state-item-count">{{ site.posts.length }}</span>
          <span class="site-state-item-name">{{ __('state.posts') }}</span>
        </div>
        <div class="site-state-item site-state-tags">
            <span class="site-state-item-count">{{ site.tags.length }}</span>
            <span class="site-state-item-name">{{ __('state.tags') }}</span>
        </div>
        <div class="site-state-item site-state-pages">
            <span class="site-state-item-count">{{ site.pages.length }}</span>
            <span class="site-state-item-name">{{ __('state.pages') }}</span>
        </div>
      </div>

      <div class="social-info motion-element">
            <span class="soclial-item">
              <a href="https://github.com/lurrpis" target="_blank"><i class="fa fa-github-alt"></i> GitHub</a>
            </span>
            <span class="soclial-item">
              <a href="http://weibo.com/lurrpis" target="_blank"><i class="fa fa-weibo"></i> WeiBo</a>
            </span>
            <span class="soclial-item">
              <a href="javascript:void(0)" target="_blank" id="wechat"><i class="fa fa-weixin"></i> WeChat</a>
            </span>
            <div class="div-email">
              <span class="soclial-item">
                <a href="mailto:hi@lurrpis.com" target="_blank"><i class="fa fa-paper-plane"></i> Email:hi@lurrpis.com</a>
              </span>
            </div>
            <div class="ercode">
              <img src="http://static.blog.lurrpis.com/wechat/ercode_fixed.png">
            </div>
      </div>
    </div>

    {% if is_post() %}
      <div class="post-toc sidebar-panel-active">
        {{ toc(page.content, {"class": "nav"}) }}
      </div>
    {% endif %}
  </div>
</div>
