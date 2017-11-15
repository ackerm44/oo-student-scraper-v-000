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
      :profile_url => "./fixtures/student-site/" + student.css("a").attribute("href").value
      }
    end
    puts students_hash
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
