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
end