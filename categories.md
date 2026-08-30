---
layout: default
title: Categories
permalink: /categories/
---

<section class="page-header">
  <h1>Categories</h1>
</section>

<section class="content-page">
  <p>Browse posts organized by category. Click a post title to read the full article.</p>

  <ul class="categories-list">
    {% for category in site.categories | sort %}
      {% assign cat_name = category[0] %}
      <li id="{{ cat_name | slugify }}">
        <h2>{{ cat_name }} ({{ category[1].size }})</h2>
        <ul>
          {% for post in category[1] %}
            <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a> <small>{{ post.date | date: "%Y-%m-%d" }}</small></li>
          {% endfor %}
        </ul>
      </li>
    {% endfor %}
  </ul>
</section>
