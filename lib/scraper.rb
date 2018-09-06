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


  def self.scrape_profile_page(profile_url)
    html = Nokogiri::HTML(open(profile_url))
    
    html.css(".   ")
    student_profile_list = {
      student_list[:twitter_url] url if url.include?("twitter")
      student_list[:linkedin_url] url if url.include?("linkedin")
      student_list[:github_url] url if url.include?("github")
      student_list[:blog_url] url if 
      student_list[:profile_quote]
      student_list[:bio]
    }
    
  end

end

