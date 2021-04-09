require "test_helper"

class RatingTest < ActiveSupport::TestCase
  test "is valid when rating is between 0 and 10" do
    0.upto(10).each do |number|
      rating = Rating.new(score: number)
      rating.valid?
      assert_empty rating.errors[:score]
    end
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
