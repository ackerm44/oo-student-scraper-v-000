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
    profile_url = File.read('fixtures/student-site/students/aaron-enser.html')
    doc = Nokogiri::HTML(profile_url)

    profile_hash = {}

    twitter = doc.css(".social-icon-container a").attributes('href').value

    binding.pry

  end

end

Scraper.scrape_profile_page('/fixtures/student-site/students/aaron-enser.html')
