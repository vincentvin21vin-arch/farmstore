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

  <div class="page-grid">
    <div class="main-column">
      <ul class="categories-list">
    {% for category in site.categories | sort %}
      {% assign cat_name = category[0] %}
      <li id="{{ cat_name | slugify }}">
        <h2>{{ cat_name }} ({{ category[1].size }})</h2>
        <ul class="category-posts">
          {% for post in category[1] limit:8 %}
            <li>
              <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
              <div class="post-meta">{{ post.date | date: "%Y-%m-%d" }}</div>
            </li>
          {% endfor %}
          {% if category[1].size > 8 %}
            <li><a href="{{ '/category/' | append: cat_name | downcase | replace: ' ', '-' | append: '.html' | relative_url }}">See all posts in {{ cat_name }} →</a></li>
          {% endif %}
        </ul>
      </li>
    {% endfor %}
      </ul>
    </div>
    <aside class="side-column">
      {% include category-sidebar.html %}
    </aside>
  </div>
</section>
