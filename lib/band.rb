require 'nokogiri'
require_relative 'parse'

class Band

  def self.show_band_page(html)
    # File.write 'out.html', html
    page = Nokogiri::HTML(html)
    band_values = {}
    band_keys = {0 => "country", 1 => "location", 2 => "status", 3 => "active_since", 4 => "genre", 5 => "themes", 6 => "label", 7 => "years_active"}
    page.css('div#band_stats dd').each_with_index do |item, index|
      band_values[band_keys[index]] = item.content.strip.split.join " "
    end
    page.css("div#band_disco ul li:eq(1) a").map { |link|
      band_values['discography'] = show_band_discography link['href']
    }
    band_values
    # show_band_members page, members
    # page.css("div#band_tab_discography").map do |prev_elem|
    #   prev_elem.previous_element.css('li:eq(4) a').map do |link|
    #     show_similar_bands "#{link['href']}?showMoreSimilar=1#Similar_artists"
    #   end
    # end
    # sel = ''
    # case links
    #   when 'official' then sel = 'Official'
    #   when 'merchandise' then sel = 'Official_merchandise'
    #   when 'unofficial' then sel = 'Unofficial'
    #   when 'labels' then sel = 'Labels'
    #   when 'tablatures' then sel = 'Tablatures'
    # end
    # page.css("div#band_tab_discography").map do |prev_elem|
    #   prev_elem.previous_element.css('li:eq(5) a').map do |link|
    #     show_band_links link['href'], sel
    #   end
    # end
  end

  def self.show_band_discography(url)
    res = Nokogiri::HTML Parse.get_url url
    discography = []
    discog_keys = {0 => "name", 1 => "type", 2 => "year", 3 => "reviews"}
    res.css('tbody tr').each do |album|
      disc = {}
      album.css('td').map.with_index do |item, index|
        disc[discog_keys[index]] = item.content.strip.split.join " "
      end
      discography.push disc
    end
    discography
  end

  def self.show_band_members(page, param)
    members = [[],[],[]]
    member_keys = {0 => "Name", 1 => "Instrument", 2 => "Bands"}
    page.css("div#band_tab_members_#{param} div table tr td").each_with_index do |member, i|
      members[i] = member.content.strip.split.join " "
    end
    puts "\n\n////Members\\\\\\\\"
    members = Parse.format_array members, member_keys
    members.each do |member|
      puts member
    end
  end
  
  def self.show_similar_bands(url)
    res = Nokogiri::HTML Parse.get_url url
    bands = []
    band_keys = {0 => "Name", 1 => "Country", 2 => "Genre"}
    res.css('tbody tr td').each do |band|
      bands.push band.content.strip.split.join " "
    end
    puts "\n\n////Similar bands\\\\\\\\"
    bands = Parse.format_array bands, band_keys
    bands.each do |band|
      puts band
    end
  end
  
  def self.show_band_links(url, param)
    res = Nokogiri::HTML Parse.get_url url
    links = []
    link_keys = {0 => "Name", 1 => "Country", 2 => "Genre"}
    if param.eql? ""
      res.css("table tr td a").each do |link|
        links.push "#{link['title'].sub("Go to: ","")}: #{link['href']}"
      end
    else
      res.css("table#linksTable#{param.capitalize} tr td a").each do |link|
        links.push "#{link['title'].sub("Go to: ","")}: #{link['href']}"
      end
    end
    puts "\n\n////Links\\\\\\\\"
    links = Parse.format_array links, link_keys
    links.each do |link|
      puts link
    end
  end
  
end