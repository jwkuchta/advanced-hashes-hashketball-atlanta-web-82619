require "pry"
def game_hash
    {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
          {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
          {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
          {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
          {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
          {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ]
    },
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => [
          {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
          {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
          {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
          {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
          {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
    ]
  }
}
end

def num_points_scored(name)
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      if player[:player_name] == name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, data|
    if data[:team_name] == team_name
      return data[:colors]
    end
  end
end

def team_names
  game_hash.map {|team, data| data[:team_name]}
end

def player_numbers(team_name)
  players_numbers = []
  game_hash.each do |home_away, data|
    if data[:team_name] == team_name
      data[:players].each do |player|
        player.each do |key, value|
          if key == :number
            players_numbers.push(value)
          end
        end
      end
    end
  end
  players_numbers
end

def player_stats(name)
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      if player.has_value?(name)
        player.delete(:player_name)
        return player
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  winner = nil
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        winner = player[:player_name]
      end
    end
  end
  winner
end

def winning_team
  team_points = 0
  most_points = 0
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      team_points += player[:points]
      if team_points > most_points
        return data[:team_name]
      end
    end
  end
end

def player_with_longest_name
  longest_name = 0
  winner = ""
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      if player[:player_name].length > longest_name
        longest_name = player[:player_name].length
        winner = player[:player_name]
      end
    end
  end
  winner
end

def long_name_steals_a_ton?
  most_steals = 0
  winner = ""
  game_hash.each do |home_away, data|
    data[:players].each do |player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
        winner = player[:player_name]
      end
    end
  end
  return true if winner == player_with_longest_name
end
