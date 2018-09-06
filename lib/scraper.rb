require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))
    student_list = []
        html.css(".student-card").collect do |student|
      student_hash = {
            name: student.css(".student-name").text,
            location: student.css(".student-location").text,
            profile_url: student.css("a").attribute("href").value
      }
            student_list << student_hash
        end
    student_list
  end


  