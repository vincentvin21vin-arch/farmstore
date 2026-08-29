# Local startup guide

This project is a Jekyll-based farm blog. Use the steps below to run it locally on your machine.

## Prerequisites

Before starting, install:

- Ruby
- Bundler
- Git

On Windows, it is usually easiest to use RubyInstaller and then run:

```bash
gem install bundler
```

## Install dependencies

From the project root:

```bash
bundle install
```

If you see version or dependency issues, run:

```bash
bundle update
```

## Start the site locally

```bash
bundle exec jekyll serve --host 0.0.0.0 --port 4000
```

Then open:

```text
http://localhost:4000
```

## Useful commands

- Rebuild the site:

```bash
bundle exec jekyll build
```

- Start in watch mode:

```bash
bundle exec jekyll serve --watch --host 0.0.0.0 --port 4000
```

## Troubleshooting

### Bundler not found

```bash
gem install bundler
```

### Ruby dependency errors

Update your Ruby and Bundler to current versions, then rerun:

```bash
bundle install
```

### Port already in use

Use another port:

```bash
bundle exec jekyll serve --host 0.0.0.0 --port 4001
```

## Notes

This project stores generated content under the `_posts` and `_site` folders. The local preview reflects your current Jekyll build and is useful for checking content, layout, and pages before publishing.
