class Scraping
  def self.meal_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get('https://www.lettuceclub.net/recipe/category/')
    elements = current_page.search('.p-category-index_title a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      cuisine_urls('https://www.lettuceclub.net' + link)
    end
  end


  def self.cuisine_urls(link)
    sites = []
    agent = Mechanize.new

    (1..10).each do |i|
      cur_page = agent.get(link + "p#{i}")
      eles = cur_page.search('.result_list-article a')
      eles.each do |el|
        sites << el.get_attribute('href')
      end
    end
    sites.each do |site|
      get_cuisine('https://www.lettuceclub.net' + site)
    end
  end

  def self.get_cuisine(site)
    agent = Mechanize.new
    page = agent.get(site)
    name = page.at('.recipe-title').inner_text if page.at('.recipe-title')
    genre = page.at('.outline-category dl:nth-child(1) dd a:nth-child(1)').inner_text if page.at('.outline-category dl:nth-child(1) dd a:nth-child(1)')
    calorie = page.at('.outline-data em:first-child').inner_text if page.at('.outline-data em:first-child')
    food = page.search('.recipe-material-item')
    amount = page.search('.recipe-material-item')
    cuisine = Cuisine.where(name: name).first_or_initialize
    cuisine.genre = genre
    cuisine.calorie = calorie
    cuisine.save
    food.zip(amount).each do |f, a|
      food = f.inner_text
      food.match("…")
      food = $`
      amount = a.inner_text
      amount.match("…")
      amount = $'
      foodstuff = Foodstuff.new(food: food, amount: amount, cuisine_id: cuisine.id)
      foodstuff.save
    end
  end
end