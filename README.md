# Farm Store

This Jekyll site is built for a farm product and agriculture blog. It includes:

- A home page with practical farm news and features
- About, Contact, Privacy Policy, and Terms pages
- 100 long-form farm posts generated in a content-safe layout
- Google AdSense ad placements in the main layout and article template

## Local preview

For detailed setup and troubleshooting, see [LOCAL_STARTUP.md](LOCAL_STARTUP.md).

```bash
bundle install
bundle exec jekyll serve --host 0.0.0.0 --port 4000
```

## GitHub Pages deployment

1. Push this folder to a GitHub repository.
2. Enable GitHub Pages in repository settings.
3. Update the `url` in `_config.yml` to your GitHub Pages URL.
4. Publish the default branch or a docs folder as configured.
