---
layout: default
title: Farm Store | Farm Products and Rural Living
---

<section class="hero">
  <div class="hero-copy">
    <span class="eyebrow">Farm store blog</span>
    <h1>Farm Store</h1>
    <p>Everything you need to know about farm products, modern agriculture, animal care, soil health, crop planning, and the practical life of productive farms.</p>
    <div class="hero-buttons">
      <a href="{{ '/about/' | relative_url }}" class="button primary">Learn about us</a>
      <a href="{{ '/contact/' | relative_url }}" class="button secondary">Talk to our team</a>
    </div>
  </div>
  <div class="hero-panel">
    <h2>Popular topics</h2>
    <ul>
      <li>Crop planning and seasonal care</li>
      <li>Organic soil improvement</li>
      <li>Livestock health and welfare</li>
      <li>Irrigation and water-saving systems</li>
      <li>Farm business and profitability</li>
    </ul>
  </div>
</section>

<section class="info-grid">
  <article>
    <h3>Growing smarter</h3>
    <p>We break down proven methods in crop rotation, soil testing, harvesting strategies, and efficient use of inputs so your farm stays productive.</p>
  </article>
  <article>
    <h3>Healthy animals</h3>
    <p>Our livestock content covers feeding plans, barn hygiene, disease prevention, breeding timing, and practical routines that support animal welfare.</p>
  </article>
  <article>
    <h3>Business-minded advice</h3>
    <p>From farm budgeting to product value chains, we help growers and producers make better decisions from field to market.</p>
  </article>
</section>

<section class="posts-list">
  <h2>Latest articles</h2>
  {% for post in site.posts limit:12 %}
    <article class="post-card">
      <div class="post-card__meta">{{ post.date | date: '%B %d, %Y' }} · {{ post.categories | first }}</div>
      <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
      <p>{{ post.excerpt | strip_html | truncatewords: 28 }}</p>
      <a href="{{ post.url | relative_url }}" class="read-more">Read article →</a>
    </article>
  {% endfor %}
</section>
