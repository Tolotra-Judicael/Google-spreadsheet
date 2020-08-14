	class Scrapper
  #Recupération de l'e-mail d'une mairie du Val d'Oise
def get_townhall_email(townhall_url)
     page = Nokogiri::HTML(open(townhall_url))
     hash = {'ville' => "#{page.xpath("/html[1]/body[1]/div[1]/main[1]/section[1]/div[1]/div[1]/div[1]/h1[1]").text}" , 'email' =>  page.xpath("/html[1]/body[1]/div[1]/main[1]/section[2]/div[1]/table[1]/tbody[1]/tr[4]/td[2]").text}
     puts hash
     return hash
  end


#Recupération des URLs de chaque ville du Val d'Oise
def get_townhall_urls
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  url_array = []

  urls = page.xpath('//*[@class="lientxt"]/@href') 

  urls.each do |url| 
    url = "http://annuaire-des-mairies.com/"+ url.text[1..-1] 
    url_array << url
  end
  return url_array
end
  def initialize(dept)
     @array=[]
     get_townhall_urls.map{|i| @array << get_townhall_email(i)}
     return @array
  end
  
  def save_as_JSON
    File.open("db/emails.json","w") do |f|
      f.write(@array.map{|i| Hash[i.each_pair.to_a]}.to_json)
    end
  end

  def save_as_spreadsheet
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("pz7XtlQC-PYx-jrVMJErTcg").worksheets[0]
    ws[1, 1] = @array.first.keys[0]
    ws[1, 2] = @array.first.keys[1]
    @arr.map.with_index{|hash,index|
      ws[index+2, 1] = hash['ville']
      ws[index+2, 2] = hash['email']
    }
    ws.save
  end  

  def save_as_csv
    CSV.open("db/emails.csv", "wb") do |csv|
      csv << @array.first.keys
      @array.each do |hash|
        csv << hash.values
      end
    end
  end
end