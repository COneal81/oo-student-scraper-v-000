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
    	student_list = {}
      html = Nokogiri::HTML(open(profile_url))
    
      html.css("div.mail-wrapper.profile.social-icon-container a").each do |info|
       if info.attribute("href").value.include?("twitter")
         student_list[:twitter] = info.attribute("href").value
      elsif info.attribute("href").value.include?("linkedin")
      student_list[:linkedin] = info.attribute("href").value
      elsif info.attribute("href").value.include?("github")
      student_list[:github] = info.attribute("href").value 
    else student_list[:blog] = info.attribute("href").value
  end
end
  student_list[:profile_quote] = html.css("div.main-wrapper.vitals-text-container.profile-quote").text
  student_list[:bio] = html.css("div.main-wrapper.profile.description-holder p").text 
  student_list
end
end