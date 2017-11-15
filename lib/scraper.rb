require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = File.read('fixtures/student-site/index.html')
    doc = Nokogiri::HTML(index_url)

    students_hash = {}

    doc.css(".roster-cards-container").each do |student|
      students_hash = {
      :name => doc.css("div.student-card").first.css("h4.student-name").text,
      :location => doc.css("div.student-card").first.css("p.student-location").text,
      :profile_url => "./fixtures/student-site/" + doc.css("div.student-card a").attribute("href").value
      }
      puts students_hash
    end

    students_hash

    # student = doc.css(".student-card")
    # student_name = doc.css("div.student-card").first.css("h4.student-name").text
    # student_location = doc.css("div.student-card").first.css("p.student-location").text
    # student_url = doc.css("div.student-card a").attribute("href").value

    #binding.pry

  end

  def self.scrape_profile_page(profile_url)

  end

end

Scraper.scrape_index_page('../fixtures/student-site/index.html')
