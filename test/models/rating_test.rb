require "test_helper"

class RatingTest < ActiveSupport::TestCase
  test "is valid when rating is between 0 and 10" do
    rating = Rating.new(score: 2)
    rating.valid?
    assert_empty rating.errors[:score]
  end

  test "is invalid when rating is less than 0" do
    rating = Rating.new(score: -1)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "is invalid when rating is greater than 10" do
    rating = Rating.new(score: 11)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end
end
