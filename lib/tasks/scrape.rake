namespace :scrape do 
  task :channels => :environment do
    Channel.all.each do |channel|
      channel.scrape_for_articles
    end
  end

  task :set_keywords => :channels do
    Channel.all.each do |channel|
      channel.articles.each do |article|
        article.set_keywords
      end
    end
  end
end
