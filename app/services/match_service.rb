class MatchService < BaseService
  def find_matches(tour_id = nil)
    tournament = Tournament.where(:id => tour_id).first || Tournament.first
    result = []
    a = Mechanize.new

    begin
      a.get('http://www.fifa.com/worldcup/matches/index.html') do |page|
       
        mu_fixtures = page.search(".match-list-date.anchor .mu.fixture")
        mu_fixtures.each do |e|
          match = {}

          match[:start_time] = e.search(".mu-i-datetime").text().gsub(" Local time", "").to_time

          match[:group] = e.search(".mu-i-group").text()

          playera_name = e.search(".mu-m .t.home .t-nText").text()
          playera = tournament.teams.where(:name => playera_name.upcase).first
          unless playera
            playera_name = e.search(".mu-m .t.home .t-nTri").text()
            playera = tournament.teams.where(:short_name => playera_name.upcase).first
          end

          playerb_name = e.search(".mu-m .t.away .t-nText").text()
          playerb = tournament.teams.where(:name => playerb_name.upcase).first
          unless playerb
            playerb_name = e.search(".mu-m .t.away .t-nTri").text()
            playerb = tournament.teams.where(:short_name => playerb_name.upcase).first
          end
          

          match[:playera_id] = playera.id
          match[:playerb_id] = playerb.id

          match[:name] = "#{playera.name}-#{playerb.name}"
          match[:short_description] = "#{playera.name}-#{playerb.name}"
          match[:description] = "#{playera.name}-#{playerb.name}"

          puts tournament.matches.create(match)

          result << match

          if e["id"] == "300186506"
            break
          end
        end
      end
    rescue => ex
      puts ex.message
      
    end

    result
  end


  def find_teams_player_html()
    
    result = []
    a = Mechanize.new

    begin
      teams_hash = {}
      a.get('http://worldcup.thanhnien.com.vn/') do |page|
       
        teams_div = page.search(".common-box #team")
        teams_div.each do |e|
          links = e.search("a")
          
          links.each do |link|
            team_abbr = link.text()

            team = Team.where(:short_name => team_abbr).first
            next unless team

            teams_hash[team.id] = {
              obj: team,
              tn_link: link.attributes["href"].to_s
            }
          end
        end
      end

      teams_hash.keys.each do |key|
        url = "http://worldcup.thanhnien.com.vn#{teams_hash[key][:tn_link]}"
        puts "update: #{teams_hash[key][:obj].name}  :  #{url}"
        a.get(url) do |page|
       
          players_div = page.search("table#page_team_1_block_team_squad_9-table")
          players_div.each do |e|
            html = "<table>#{e.inner_html}</table>"

            html.gsub!('a href="/', 'a href="' + 'http://worldcup.thanhnien.com.vn' + '/')
            html.gsub!('img src="/', 'img src="' + 'http://worldcup.thanhnien.com.vn' + '/')

            teams_hash[key][:obj].update_attribute(:players_html, html)
          end
        end
      end
    rescue => ex
      puts ex.message
      
    end

    result
  end


  def find_news()
    
    result = []
    a = Mechanize.new

    begin
      news_links = []
      news_imgs = []
      a.get('http://www.fifa.com/worldcup/news/all-news.html') do |page|
       
        links = page.search("a.dcm-internal")
        links.each do |link|
          href = link.attributes["href"].to_s
          next unless href.index("worldcup/news")
          
          news_links << "http://www.fifa.com#{href}"

          img = link.search("img.i-lnd-3").first

          news_imgs << (img.attributes["src"].to_s rescue "http://worldcup.thanhnien.com.vn/App_Themes/Images/wc_logo.png")
        end
      end

      news_links.each_with_index do |link, index|

        a.get(link) do |page|
          post_hash = {}
          h1_title = page.search("h1.dcm-articletitle")
          post_hash[:title] = h1_title.first.text()

          main_section = page.search("section.col-xs-8.article-container")

          post_hash[:body] = "<section class='article-container'>#{main_section.first.inner_html}</section>"

          next if Post.where(:title => post_hash[:title]).first
          
          post = Post.create(post_hash)

          if post
            post.main_image_from_url(news_imgs[index])
            post.save
          end
        end
      end
    rescue => ex
      puts ex.message
      
    end

    result
  end
end