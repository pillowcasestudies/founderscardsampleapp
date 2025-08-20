puts "🌱 Seeding database..."

Experience.destroy_all
Category.destroy_all

categories = [
  { name: "Travel", description: "Exclusive getaways and curated trips for members only." },
  { name: "Dining", description: "Unique culinary experiences, from private chefs to secret supper clubs." },
  { name: "Wellness", description: "Holistic retreats, spa days, and health-focused activities." },
  { name: "Networking", description: "Opportunities to connect with like-minded professionals and entrepreneurs." },
  { name: "Entertainment", description: "Concerts, private screenings, and behind-the-scenes access to events." }
]

categories.each do |cat|
  Category.create!(cat)
end

puts "✅ Created #{Category.count} categories"

experiences = []

placeholder_images = [
  "https://picsum.photos/600/400?random=1",
  "https://picsum.photos/600/400?random=2",
  "https://picsum.photos/600/400?random=3",
  "https://picsum.photos/600/400?random=4",
  "https://picsum.photos/600/400?random=5",
  "https://picsum.photos/600/400?random=6",
  "https://picsum.photos/600/400?random=7",
  "https://picsum.photos/600/400?random=8",
  "https://picsum.photos/600/400?random=9",
  "https://picsum.photos/600/400?random=10",
]

def build_experiences(category, data, placeholder_images)
  data.each_with_index.map do |exp, i|
    exp.merge(
      category_id: category.id,
      start_date: Date.today + rand(1..30),
      end_date: Date.today + rand(31..60),
      image_url: placeholder_images[i % placeholder_images.length]
    )
  end
end

# Travel
travel_category = Category.find_by(name: "Travel")
travel_data = [
  { venue_name: "Hot Air Balloon Ride", description: "Soar above the desert at sunrise in a private balloon.", price: 500, tags: "adventure, sky, sunrise" },
  { venue_name: "Luxury Safari", description: "Exclusive safari tour with a private guide and luxury tents.", price: 1200, tags: "safari, wildlife, luxury" },
  { venue_name: "Island Hopping Tour", description: "Private yacht tour through tropical islands with gourmet dining.", price: 1500, tags: "yacht, islands, tropical" },
  { venue_name: "Mountain Trekking Expedition", description: "Guided trek through scenic mountain trails with expert instructors.", price: 800, tags: "hiking, adventure, nature" },
  { venue_name: "Cultural City Tour", description: "VIP guided tour exploring historical landmarks and cultural highlights.", price: 400, tags: "city, culture, tour" }
]
experiences += build_experiences(travel_category, travel_data, placeholder_images)

# Dining
dining_category = Category.find_by(name: "Dining")
dining_data = [
  { venue_name: "Private Wine Tasting", description: "Sample fine wines curated by a top sommelier.", price: 250, tags: "wine, tasting, gourmet" },
  { venue_name: "Chef’s Table Dinner", description: "Intimate dinner prepared by a renowned chef.", price: 400, tags: "dining, luxury, chef" },
  { venue_name: "Secret Supper Club", description: "Exclusive multi-course meal at a hidden location.", price: 300, tags: "food, secret, exclusive" },
  { venue_name: "Chocolate & Dessert Experience", description: "Indulge in a private chocolate-making and tasting session.", price: 150, tags: "chocolate, dessert, workshop" },
  { venue_name: "Farm-to-Table Experience", description: "Enjoy a curated meal prepared with fresh local ingredients.", price: 200, tags: "organic, local, farm" }
]
experiences += build_experiences(dining_category, dining_data, placeholder_images)

# Wellness
wellness_category = Category.find_by(name: "Wellness")
wellness_data = [
  { venue_name: "Mindfulness Retreat", description: "Weekend of yoga, meditation, and wellness workshops.", price: 750, tags: "yoga, meditation, relaxation" },
  { venue_name: "Spa Day Escape", description: "Rejuvenate with massage, sauna, and holistic treatments.", price: 300, tags: "spa, massage, wellness" },
  { venue_name: "Detox & Nutrition Workshop", description: "Guided sessions on nutrition, detox, and healthy living.", price: 200, tags: "detox, nutrition, health" },
  { venue_name: "Outdoor Wellness Hike", description: "Nature hike combined with mindfulness exercises.", price: 150, tags: "hiking, meditation, nature" },
  { venue_name: "Pilates & Fitness Bootcamp", description: "Intensive private fitness and pilates session.", price: 180, tags: "fitness, pilates, health" }
]
experiences += build_experiences(wellness_category, wellness_data, placeholder_images)

# Networking
networking_category = Category.find_by(name: "Networking")
networking_data = [
  { venue_name: "Tech Leaders Mixer", description: "Invite-only networking with top founders and executives.", price: 100, tags: "tech, networking, business" },
  { venue_name: "Startup Pitch Night", description: "Meet entrepreneurs pitching innovative ideas.", price: 80, tags: "startup, pitching, investors" },
  { venue_name: "Industry Roundtable", description: "Small group discussion with thought leaders in the industry.", price: 120, tags: "roundtable, business, leaders" },
  { venue_name: "Professional Lunch Meetup", description: "Connect over lunch with professionals from your field.", price: 60, tags: "lunch, networking, professionals" },
  { venue_name: "Investor & Founder Evening", description: "Exclusive evening connecting investors with founders.", price: 150, tags: "investors, founders, exclusive" }
]
experiences += build_experiences(networking_category, networking_data, placeholder_images)

# Entertainment
entertainment_category = Category.find_by(name: "Entertainment")
entertainment_data = [
  { venue_name: "Private Concert", description: "Intimate live performance from a rising artist.", price: 300, tags: "music, concert, exclusive" },
  { venue_name: "Movie Premiere Screening", description: "Attend a private movie premiere with cast appearances.", price: 250, tags: "film, premiere, VIP" },
  { venue_name: "Backstage Theater Tour", description: "Go behind the scenes at a renowned theater.", price: 200, tags: "theater, backstage, tour" },
  { venue_name: "Comedy Night Exclusive", description: "Private comedy show with top comedians.", price: 180, tags: "comedy, show, exclusive" },
  { venue_name: "Art Gallery Private Viewing", description: "Enjoy a private tour and viewing of a modern art gallery.", price: 220, tags: "art, gallery, private" }
]
experiences += build_experiences(entertainment_category, entertainment_data, placeholder_images)

# Create all experiences
experiences.each do |exp|
  Experience.create!(exp)
end

puts "✅ Created #{Experience.count} experiences"
puts "🌱 Seeding done!"
