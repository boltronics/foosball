module Elo
  class Calculator
    class << self
      # kg(w - we)
      # k = weight index
      # g = goal difference
      # w = result
      # we = expected result
      def p pts1, pts2, score1, score2, weight
        weight * g(score1, score2) * (w(score1, score2) - we(pts1, pts2))
      end

      def we pts1, pts2

      end

      def w score1, score2
        case score1 <=> score2
        when 1
          1
        when 0
          0.5
        when -1
          0
        end
      end

      # goal difference
      # 0/+1 = 1
      # +2 = 3/2
      # +3 and higher = (11 + diff) / 8
      def g score1, score2
        difference = score_difference(score1, score2)
        case difference
        when 0, 1
          1
        when 2
          3/2.0
        else
          (11 + difference) / 8.0
        end
      end

      def score_difference score1, score2
        diff = score1 - score2
        diff *= -1 if diff < 0
        diff
      end

      def k match_type
        case match_type
        when "world_cup"
          60
        when "continental_championship", "intercontinental_tournament"
          50
        when "world_cup_qualifier", "continental_qualifier", "major_tournament"
          40
        when "other_tournament"
          30
        else
          20
        end
      end
    end
  end
end
