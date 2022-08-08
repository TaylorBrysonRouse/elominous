class EloService
  EXPECTED_DIVIDEND = 400.00
  ELO_PARAM = 32.00

  def self.elo_score_generator(winner, loser, sport)
    if winner.sport_elo_ratings.sport(sport.sport).present?
      winner_rating = winner.sport_elo_ratings.sport(sport.sport).elo_rating.to_f
    else
      puts "making new elo"
      SportEloRating.create(user_id: winner.id, sport_id: sport.id)
      winner_rating = winner.sport_elo_ratings.sport(sport.sport).elo_rating.to_f
    end

    if loser.sport_elo_ratings.sport(sport.sport).present?
      loser_rating = loser.sport_elo_ratings.sport(sport.sport).elo_rating.to_f
    else
      puts "making new elo"
      SportEloRating.create(user_id: loser.id, sport_id: sport.id)
      loser_rating = loser.sport_elo_ratings.sport(sport.sport).elo_rating.to_f
    end

    winner_expected = 1.00 / (1 + (10 ** ((loser_rating - winner_rating)/EXPECTED_DIVIDEND)))
    loser_expected = 1.00 / (1 + (10 ** ((winner_rating - loser_rating)/EXPECTED_DIVIDEND)))


    winner_elo_rating = winner_rating + ELO_PARAM * (1.00 - winner_expected)
    loser_elo_rating = loser_rating + ELO_PARAM * (0.00 - loser_expected)

    SportEloRating.where(user_id: winner.id, sport: sport.id).update_all(["elo_rating = #{winner_elo_rating}"])
    SportEloRating.where(user_id: loser.id, sport: sport.id).update_all(["elo_rating = #{loser_elo_rating}"])
  end
end