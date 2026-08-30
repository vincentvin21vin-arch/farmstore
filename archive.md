---
layout: default
title: Archive
---

<section class="page-header">
  <h1>Archive</h1>
</section>

<section class="content-page">
  <p>All posts, organized by year and month for easier browsing.</p>

  <div class="archive-list">
    {% assign posts = site.posts | sort: 'date' | reverse %}
    {% assign previous_year = nil %}
    {% assign previous_month = nil %}
    <ul>
    {% for post in posts %}
      {% assign Y = post.date | date: "%Y" %}
      {% assign M = post.date | date: "%B" %}

      {% if Y != previous_year %}
        {% if previous_year != nil %}</ul>{% endif %}
        <h2>{{ Y }}</h2>
        {% assign previous_year = Y %}
        {% assign previous_month = nil %}
        <ul>
      {% endif %}

      {% if M != previous_month %}
        <h3>{{ M }}</h3>
        {% assign previous_month = M %}
      {% endif %}

      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a> — <small>{{ post.date | date: "%Y-%m-%d" }}</small></li>
    {% endfor %}
    </ul>
  </div>
</section>
