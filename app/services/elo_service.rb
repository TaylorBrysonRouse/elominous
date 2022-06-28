class EloService
  EXPECTED_DIVIDEND = 400.00
  ELO_PARAM = 32.00

  def self.elo_score_generator(winner, loser)
    winner_rating = winner.elo_rating.to_f
    loser_rating = loser.elo_rating.to_f

    winner_expected = 1.00 / (1 + (10 ** ((loser_rating - winner_rating)/EXPECTED_DIVIDEND)))
    loser_expected = 1.00 / (1 + (10 ** ((winner_rating - loser_rating)/EXPECTED_DIVIDEND)))

    winner.elo_rating = winner_rating + ELO_PARAM * (1.00 - winner_expected)
    loser.elo_rating = loser_rating + ELO_PARAM * (0.00 - loser_expected)
  end
end