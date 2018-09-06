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
end


  def self.scrape_profile_page(profile_url)
    	    students_list = {}

     html = Nokogiri::HTML(open(profile_url))
    html.css("div.social-icon-controler a").each do |student|
        url = student.attribute("href")
        students_list[:twitter_url] = url if url.include?("twitter")
        students_list[:linkedin_url] = url if url.include?("linkedin")
        students_list[:github_url] = url if url.include?("github")
        students_list[:blog_url] = url if student.css("img").attribute("src").text.include?("rss")
    end
        students_list[:profile_quote] = html.css("div.profile-quote").text
        students_list[:bio] = html.css("div.bio-content p").text
    students_list
  end
end