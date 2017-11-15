require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = File.read('fixtures/student-site/index.html')
    doc = Nokogiri::HTML(index_url)

    students_hash = []

      doc.css("div.student-card").each do |student|
        students_hash << {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => student.css("a").attribute("href").value
        }
      end

    students_hash

  end

  def self.scrape_profile_page(profile_url)
    profile_url = File.read('fixtures/student-site/students/jason-southwell.html')
    doc = Nokogiri::HTML(profile_url)

    profile_hash = {}

    # social = doc.css(".social-icon-container a").collect {|link| link['href']}
    # github = social.grep(/github/)
    # twitter = social.grep(/twitter/)
    # linkedin = social.grep(/linkedin/)
    # blog = social.grep(/blog/)
    # profile_quote = doc.css(".profile-quote").text
    # bio = doc.css(".bio-content .description-holder p").text
    #
    # binding.pry
    #
     social = doc.css(".social-icon-container a").collect {|link| link['href']}
     github_value = social.grep(/github/).join
     twitter_value = social.grep(/twitter/)
     linkedin_value = social.grep(/linkedin/)
     blog_value = social.grep(/blog/)

    # social.each do |link|
    #   if link.scan(/twitter/)
    #     twitter_value = link
    #   end
    # end

    profile_hash = {

      :twitter => twitter_value,
      :linkedin => linkedin_value,
      :github => github_value,
      :blog => blog_value,
      :profile_quote => doc.css(".profile-quote").text,
      :bio => doc.css(".bio-content .description-holder p").text
    }

    #binding.pry
    #
    profile_hash

  end

end

Scraper.scrape_profile_page('fixtures/student-site/students/jason-southwell.html')
