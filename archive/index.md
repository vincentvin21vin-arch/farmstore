---
layout: default
title: Archive
---

<section class="page-header">
  <h1>Archive</h1>
</section>

<section class="content-page">
  <p>All posts, organized by year and month for easier browsing.</p>

  <div class="page-grid">
    <div class="main-column">
      <div class="archive-list">
        {% assign posts = site.posts | sort: 'date' | reverse %}
        {% assign prev_year = nil %}
        {% assign prev_month = nil %}

        {% for post in posts %}
          {% assign Y = post.date | date: "%Y" %}
          {% assign M = post.date | date: "%B" %}

          {% if Y != prev_year %}
            {% if prev_month != nil %}
              </ul>
            {% endif %}
            {% if prev_year != nil %}
              </div>
            {% endif %}

            <div class="year-block">
              <h2>{{ Y }}</h2>
            {% assign prev_year = Y %}
            {% assign prev_month = nil %}
          {% endif %}

          {% if M != prev_month %}
            {% if prev_month != nil %}
              </ul>
            {% endif %}
            <h3>{{ M }}</h3>
            <ul class="month-list">
            {% assign prev_month = M %}
          {% endif %}

          <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a> — <small>{{ post.date | date: "%Y-%m-%d" }}</small></li>

        {% endfor %}

        {% if prev_month != nil %}
          </ul>
        {% endif %}
        {% if prev_year != nil %}
          </div>
        {% endif %}
      </div>
    </div>
    <aside class="side-column">
      {% include category-sidebar.html %}
    </aside>
  </div>
</section>
