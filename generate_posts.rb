require 'fileutils'
require 'date'

root = File.expand_path(__dir__)
posts_dir = File.join(root, '_posts')
category_dir = File.join(root, 'category')
FileUtils.mkdir_p(posts_dir)
FileUtils.mkdir_p(category_dir)

categories = [
  'Crop Production',
  'Soil Health',
  'Livestock Care',
  'Dairy Farming',
  'Organic Farming',
  'Irrigation & Water',
  'Greenhouse Growing',
  'Farm Equipment',
  'Pest Management',
  'Farm Business',
  'Sustainable Agriculture',
  'Agri-Tech'
]

base_titles = [
  'Seasonal planning for stronger harvests',
  'Building resilient soil with practical steps',
  'How healthy animals support a better farm cycle',
  'Reducing feed waste without hurting output',
  'Choosing the right crop mix for local markets',
  'Water conservation methods that work on real farms',
  'What a modern greenhouse should prioritize',
  'Essential tools for small and medium farms',
  'Smart pest control that protects yield and profit',
  'Balancing costs and income in farm operations',
  'Why regenerative ideas still matter on busy farms',
  'Using data and sensors to improve daily decisions',
  'Planning a farm calendar from planting to market',
  'How to improve seed quality and field performance',
  'Why barn ventilation is essential in hot weather',
  'Top lessons from profitable dairy herds',
  'Preparing compost systems for steady organic growth',
  'How to choose pumps and irrigation lines wisely',
  'Managing greenhouse humidity without waste',
  'When to repair, replace, or upgrade machinery',
  'A realistic guide to integrated pest management',
  'How to reduce production loss during peak season',
  'What successful farm budgeting really looks like',
  'How farm records improve long-term decisions',
  'Why healthy soil is the base of profitable harvests',
  'Ways to improve animal comfort in winter barns',
  'How to build trust with local buyers and retailers',
  'Choosing between compost, fertilizer, and cover crops',
  'Practical steps for cleaner dairy operations',
  'Why water testing should be part of routine farm care',
  'How to protect seedlings from common stress',
  'Matching greenhouse crops to local climate patterns',
  'The value of routine maintenance on tractors and tools',
  'How to prevent pest pressure before it becomes costly',
  'Making the most of farm labor during busy periods',
  'Why diversified farms often recover faster',
  'How modern sensors help improve irrigation timing',
  'Better recordkeeping for produce quality and sales',
  'How to manage weed pressure without excess cost',
  'The benefits of stronger herd health plans',
  'Where to begin with sustainable dairy systems',
  'A guide to better organic nutrient planning',
  'How weather monitoring can reduce farm surprises',
  'Choosing the right greenhouse structure for acreage',
  'How to assess return on investment for equipment',
  'Making pest monitoring part of weekly farm routines',
  'A smart view of diversification for rural income',
  'What climate-smart farming looks like in practice',
  'How to improve field drainage without wasting money',
  'How farmers can build resilient livestock systems',
  'Why farm layout matters for movement and safety',
  'Best practices for producing cleaner milk and meat',
  'How to improve crop stand with better preparation',
  'Smart irrigation choices for small farms',
  'The role of microbial life in healthy field soils',
  'When to use automation and when to stay manual',
  'Managing greenhouse pests without harming crops',
  'A practical case for farm diversification',
  'What to check before buying used equipment',
  'How to match feeding plans with seasonal growth',
  'How to build a farm plan around priorities and cash flow',
  'The hidden value of local markets for growers',
  'Why moisture control matters in storage and handling',
  'A realistic guide to soil amendment decisions',
  'How to keep cattle calm and productive in busy systems',
  'The value of community advice for new growers',
  'Choosing the right tools for organic crop success',
  'How to protect fruit quality in warm seasons',
  'Planning farm labor with weather and crop cycles',
  'Why root health determines long-term field success',
  'What matters most in safe feed storage',
  'How farmers create resilient farm ecosystems',
  'A practical approach to farm-level sustainability',
  'The benefits of low-cost monitoring for agriculture',
  'Using field observations to adjust decisions faster',
  'How to build a more profitable farm routine',
  'What crop diversity can teach a farm team',
  'Why smart drainage saves time and inputs',
  'How to improve worker safety in farm operations',
  'A better way to think about farm improvement',
  'How seasonal records support strong output',
  'Making the most of available sunlight and temperature',
  'When to invest in storage and processing equipment',
  'Setting priorities for the farm year ahead',
  'What every successful farm team watches closely',
  'Practical ideas for reducing farm waste',
  'How to match feed quality with herd needs',
  'The path to a cleaner and more efficient farm',
  'What drives good crop quality from seed to shelf',
  'How to grow with less stress and better returns',
  'A field guide to healthy farm systems',
  'Why consistency matters more than dramatic change',
  'How to make farm decisions with more confidence',
  'Planning for growth without losing control of costs',
  'What long-term stewardship looks like in modern farming'
]

term_sets = {
  'Crop Production' => ['seed quality', 'row spacing', 'soil fertility', 'harvest timing', 'field moisture', 'market demand'],
  'Soil Health' => ['organic matter', 'root growth', 'soil structure', 'nutrient balance', 'earthworm activity', 'cover cropping'],
  'Livestock Care' => ['hoof health', 'barn hygiene', 'daily observation', 'feed consistency', 'animal comfort', 'disease prevention'],
  'Dairy Farming' => ['milk quality', 'mastitis prevention', 'cow comfort', 'feeding rhythm', 'clean facilities', 'milk flow'],
  'Organic Farming' => ['compost quality', 'biological activity', 'crop rotation', 'pollinator support', 'natural inputs', 'soil resilience'],
  'Irrigation & Water' => ['pressure management', 'drip lines', 'water timing', 'evaporation control', 'filtration', 'runoff prevention'],
  'Greenhouse Growing' => ['light balance', 'humidity control', 'ventilation', 'root zone care', 'crop spacing', 'temperature stability'],
  'Farm Equipment' => ['routine maintenance', 'tractor checks', 'operator safety', 'parts availability', 'field readiness', 'repair planning'],
  'Pest Management' => ['scouting habits', 'biological control', 'threshold checks', 'resistant varieties', 'trap monitoring', 'spray timing'],
  'Farm Business' => ['cash flow', 'cost tracking', 'sales planning', 'recordkeeping', 'market timing', 'profit margins'],
  'Sustainable Agriculture' => ['resource efficiency', 'long-term soil health', 'climate resilience', 'water stewardship', 'community value', 'land care'],
  'Agri-Tech' => ['field sensors', 'automation', 'data review', 'precision application', 'monitoring tools', 'digital records']
}

sections = [
  'Why this matters on a working farm',
  'The practical system behind growth',
  'Reducing risk and improving consistency',
  'Making better choices in daily routines',
  'The role of labor, tools, and timing',
  'How to monitor results and adjust',
  'Real-world lessons from daily farm management',
  'A steady plan for ongoing improvement'
]

# Create category landing pages.
categories.each do |category|
  slug = category.downcase.gsub(/&/, 'and').gsub(/[^a-z0-9]+/, '-')
  slug = slug.gsub(/-+/, '-')
  slug = slug.sub(/^-/, '').sub(/-$/, '')
  File.write(File.join(category_dir, "#{slug}.md"), <<~PAGE)
  ---
  layout: default
  title: #{category}
  ---

  <section class="page-header">
    <h1>#{category}</h1>
  </section>

  <section class="posts-list">
    {% assign category_posts = site.posts | where: 'categories', '#{category}' %}
    {% for post in category_posts %}
      <article class="post-card">
        <div class="post-card__meta">{{ post.date | date: '%B %d, %Y' }}</div>
        <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
        <p>{{ post.excerpt | strip_html | truncatewords: 28 }}</p>
        <a href="{{ post.url | relative_url }}" class="read-more">Read article →</a>
      </article>
    {% endfor %}
  </section>
  PAGE
end

(1..100).each do |index|
  category = categories[(index - 1) % categories.length]
  title = base_titles[(index - 1) % base_titles.length]

  if index % 7 == 0
    title = "#{category} and the future of practical farming"
  elsif index % 11 == 0
    title = "A practical guide to #{category} on modern farms"
  elsif index % 13 == 0
    title = "#{category} for better crop health and farm profit"
  end

  language = title.gsub(/[^a-z0-9]/i, '-')
  slug = language.downcase.gsub(/-+/, '-').sub(/^-/, '').sub(/-$/, '')
  date = Date.new(2026, 5, 1) + (index - 1)
  timestamp = date.strftime('%Y-%m-%d 08:00:00 +0000')

  terms = term_sets[category]
  paragraphs = []

  paragraphs << "#{title} is not just a topic for conference rooms or theory books; it is a daily practice that shapes how a farm performs across a season. When producers focus on the right routines, the results often show up in healthier crops, stronger animals, lower losses, and a more reliable income stream. For any working farm, the difference between a stressful season and a productive season often comes down to how well the operator ties planning, observation, and simple systems together."

  paragraphs << "In #{category.downcase}, small decisions appear minor when made one day at a time, yet over weeks and months they influence the whole operation. Good management depends on noticing field conditions, animal behavior, equipment readiness, and market timing before small issues grow into expensive losses. That is why strong farmers keep careful records, evaluate patterns, and build repeatable routines rather than relying on guesswork."

  sections.each do |section|
    section_paragraphs = []
    4.times do
      term_a, term_b, term_c, term_d, term_e, term_f = terms
      section_paragraphs << "On a practical farm, #{term_a} matters because it influences #{term_b}, #{term_c}, and the broader rhythm of #{term_d}. When growers pay attention to #{term_e} and #{term_f}, they reduce risk while improving consistency. This is especially relevant in #{category.downcase}, where regular observation often leads to better decisions before a problem spreads."
    end
    section_paragraphs << "This is where good management distinguishes a farm that merely survives from one that grows with control. The most productive operators tend to be the ones who think ahead, review their systems, and make adjustments early rather than waiting for stress to force reaction. They understand that timing, equipment, workforce planning, and resource use all connect to the same outcome: a stable and profitable operation."
    paragraphs << "## #{section}\n\n#{section_paragraphs.join(' ')}"
  end

  paragraphs << "The real lesson in #{category.downcase} is that profitable farming is built on details. The best livestock managers know that animal comfort, feed quality, and equipment condition influence daily results. The strongest crop growers know that soil life, moisture balance, and timing matter as much as seed choice. The most resilient farm businesses understand that pricing, recordkeeping, planning, and local demand are all part of the same production cycle."

  paragraphs << "For farmers who want long-term strength, the answer is not to chase dramatic changes but to build better habits. Review your records weekly, track what your fields and animals tell you, and make adjustments with patience and purpose. When producers combine strong routines with honest observation, they create farming systems that are more flexible, more profitable, and more prepared for the uncertainties of weather, labor, and market pressures."

  body = paragraphs.join("\n\n")
  excerpt = "#{title} explains the practical systems, everyday choices, and management patterns that farmers use to improve production, reduce waste, and build stronger operations."

  content = <<~YAML
  ---
  layout: post
  title: "#{title}"
  date: #{timestamp}
  categories:
    - "#{category}"
  tags:
    - farm
    - agriculture
    - practical farming
  author: Farm Store Editorial Team
  excerpt: "#{excerpt}"
  ---

  #{body}
  YAML

  file_name = "#{date.strftime('%Y-%m-%d')}-#{slug}.md"
  File.write(File.join(posts_dir, file_name), content)
end

puts "Generated 100 jekyll posts in #{posts_dir}"
