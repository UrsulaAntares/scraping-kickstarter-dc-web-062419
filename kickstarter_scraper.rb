# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  projects = {}



  # binding.pry

  #project:  kickstarter.css('li.project.grid_4')
  #title: project.css('h2.bbcard_name strong a').text
  #thumbnail: project.css('div.project-thumbnail a img').attribute('src').value 
  #description: project.css("p.bbcard_blurb").text
  #percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i

  kickstarter.css('li.project.grid_4').each do |project|
    title = project.css('h2.bbcard_name strong a').text
    thumbnail = project.css('div.project-thumbnail a img').attribute('src').value
    description = project.css('p.bbcard_blurb').text
    location = project.css('span.location-name').text
    percent_funded = project.css('ul.project-stats li.first.funded strong').text.gsub("%", "").to_i
    projects[title.to_sym] = {}
    projects[title.to_sym][:image_link] = thumbnail
    projects[title.to_sym][:description] = description
    projects[title.to_sym][:location] = location
    projects[title.to_sym][:percent_funded] = percent_funded
  end

  projects

end



create_project_hash
