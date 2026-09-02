---
title: "Category: {{ category }}"
layout: default
title: "Category"
published: false
permalink: "/categories/{{ page.category | downcase | replace: ' ', '-' }}/"
---

<section class="page-header">
  <h1>Category: {{ page.category }}</h1>
</section>

<section class="content-page">
  <ul class="posts-list">
    {% for post in site.categories[page.category] %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <div class="post-meta">{{ post.date | date: '%Y-%m-%d' }}</div>
      </li>
    {% endfor %}
  </ul>
</section>
