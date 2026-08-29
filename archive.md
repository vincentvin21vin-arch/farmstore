---
layout: default
title: Archive
---

<section class="page-header">
  <h1>Archive</h1>
</section>

<section class="posts-list">
  {% for post in site.posts %}
    <article class="post-card">
      <div class="post-card__meta">{{ post.date | date: '%B %d, %Y' }} · {{ post.categories | first }}</div>
      <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
      <p>{{ post.excerpt | strip_html | truncatewords: 28 }}</p>
      <a href="{{ post.url | relative_url }}" class="read-more">Read article →</a>
    </article>
  {% endfor %}
</section>
