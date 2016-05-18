require 'nokogiri'
require_relative 'parse'

class Band

  def self.show_band_page(html)
    # File.write 'out.html', html
    page = Nokogiri::HTML(html)
    band_values = {}
    members = {}
    band_keys = {0 => "country", 1 => "location", 2 => "status", 3 => "active_since", 4 => "genre", 5 => "themes", 6 => "label", 7 => "years_active"}
    page.css('div#band_stats dd').each_with_index do |item, index|
      band_values[band_keys[index]] = item.content.strip.split.join " "
    end
    page.css("div#band_disco ul li:eq(1) a").map { |link|
      band_values['discography'] = show_band_discography link['href']
    }
    # members['current'] = show_band_members page, "current"
    # members['past'] = show_band_members page, "past"
    # members['live'] = show_band_members page, "live"
    band_values['members'] = members
    page.css("div#band_tab_discography").map do |prev_elem|
      prev_elem.previous_element.css('li:eq(4) a').map do |link|
        band_values['similar'] = show_similar_bands "#{link['href']}?showMoreSimilar=1"
      end
    end
    band_values
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

  def self.show_band_members(page, type)
    members = []
    member = {}
    member_keys = {0 => "name", 1 => "instrument", 2 => "bands"}
    page.css("div#band_tab_members_#{type} div table tr td").each_with_index do |item, i|
      member[member_keys[((i+3)%3)]] = item.content.strip.split.join " "
      if (i+3)%3 == 2
        members.push member
        member = {}
      end
    end
    members
  end
  
  def self.show_similar_bands(url)
    res = Nokogiri::HTML Parse.get_url url
    bands, band = [], {}
    band_keys = {0 => "name", 1 => "country", 2 => "genre", 3 => "score"}
    res.css('tbody tr td').each_with_index do |item, i|
      band[band_keys[((i+4)%4)]] = item.content.strip.split.join " "
      if (i+4)%4 == 3
        bands.push band
        band = {}
      end
    end
    bands
    # puts "\n\n////Similar bands\\\\\\\\"
    # bands = Parse.format_array bands, band_keys
    # bands.each do |band|
    #   puts band
    # end
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