---
layout: default
title: Greenhouse Growing
---

<section class="page-header">
  <h1>Greenhouse Growing</h1>
</section>

<section class="posts-list">
  {% assign category_posts = site.posts | where: 'categories', 'Greenhouse Growing' %}
  {% for post in category_posts %}
    <article class="post-card">
      <div class="post-card__meta">{{ post.date | date: '%B %d, %Y' }}</div>
      <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
      <p>{{ post.excerpt | strip_html | truncatewords: 28 }}</p>
      <a href="{{ post.url | relative_url }}" class="read-more">Read article →</a>
    </article>
  {% endfor %}
</section>
