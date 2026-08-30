# Simple Jekyll helper to generate per-category index pages
# Run this script locally to create _category/NAME/index.md files for each category
require 'fileutils'
require 'yaml'

# Generate a per-category index page under /categories/<slug>/index.md
# Run from the site root: `ruby generate_category_pages.rb`

posts = Dir.glob("_posts/*.md")
categories = {}

posts.each do |file|
  content = File.read(file)
  if content =~ /---\s*(.*?)---/m
    front = YAML.load($1) rescue {}
    if front && front['categories']
      Array(front['categories']).each do |c|
        categories[c] ||= []
        categories[c] << File.basename(file)
      end
    end
  end
end

out_dir = File.join(Dir.pwd, 'categories')
FileUtils.mkdir_p(out_dir)

categories.each do |name, files|
  slug = name.downcase.strip.gsub(' ', '-')
  dir = File.join(out_dir, slug)
  FileUtils.mkdir_p(dir)
  path = File.join(dir, 'index.md')
  next if File.exist?(path)
  File.open(path, 'w') do |f|
    f.puts "---"
    f.puts "layout: default"
    f.puts "title: \"Category: #{name}\""
    f.puts "permalink: /categories/#{slug}/"
    f.puts "category: \"#{name}\""
    f.puts "---"
    f.puts
    f.puts "<section class=\"page-header\">"
    f.puts "  <h1>Category: #{name}</h1>"
    f.puts "</section>"
    f.puts
    f.puts "<section class=\"content-page\">"
    f.puts "  <ul class=\"posts-list\">"
    f.puts "    {% for post in site.categories['#{name}'] %}"
    f.puts "      <li><a href=\"{{ post.url | relative_url }}\">{{ post.title }}</a> — <small>{{ post.date | date: '%Y-%m-%d' }}</small></li>"
    f.puts "    {% endfor %}"
    f.puts "  </ul>"
    f.puts "</section>"
  end
  puts "Created #{path}"
end

puts "Generated #{categories.keys.size} category pages in #{out_dir}" if categories.any?
