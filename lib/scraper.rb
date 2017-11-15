require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  # def self.scrape_index_page(index_url)
  #   index_page = Nokogiri::HTML(open(index_url))
  #   students = []
  #   index_page.css("div.roster-cards-container").each do |card|
  #     card.css(".student-card a").each do |student|
  #       student_profile_link = "#{student.attr('href')}"
  #       student_location = student.css('.student-location').text
  #       student_name = student.css('.student-name').text
  #       students << {name: student_name, location: student_location, profile_url: student_profile_link}
  #     end
  #   end
  #   students
  # end

  def self.scrape_index_page(index_url)
    index_url = File.read('fixtures/student-site/index.html')
    doc = Nokogiri::HTML(index_url)

    students_hash = []

    doc.css("div.roster-cards-container").each do |card|
      card.css("div.student-card").each do |student|
        students_hash << {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => student.css("a").attribute("href")
        #:profile_url => "#{student.attr('href')}"
        }
      end
    end

    students_hash

  end

  def self.scrape_profile_page(profile_url)
  end

end

#Scraper.scrape_index_page('../fixtures/student-site/index.html')
