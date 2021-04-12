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

  test "promoter? returns true if score is 9 or 10" do
    rating = Rating.new(score: 9)
    assert rating.promoter?
  end

  test "promoter? returns false if score is less than 9" do
    rating = Rating.new(score: 1)
    assert_not rating.promoter?
  end

  test "promoter? is false if score is greater than 10" do
    rating = Rating.new(score: 11)
    assert_not rating.promoter?
  end

  test "passive? returns true if score is 7 or 8" do
    7.upto(8).each do |number|
      rating = Rating.new(score: number)
      rating.passive?
      assert rating.passive?
    end
  end

  test "passive? returns false if score is less than 7" do
    0.upto(6).each do |number|
      rating = Rating.new(score: number)
      rating.passive?
      assert_not rating.passive?
    end
  end

  test "passive? returns false if score is grater than 8" do
    9.upto(10).each do |number|
      rating = Rating.new(score: number)
      rating.passive?
      assert_not rating.passive?
    end
  end

  test "detractor returns true if score is less than or equal to 6" do
    0.upto(6).each do |number|
      rating = Rating.new(score: number)
      rating.detractor?
      assert rating.detractor?
    end
  end

  test "detractor returns false if score is grater than 6" do
    7.upto(10).each do |number|
      rating = Rating.new(score: number)
      rating.detractor?
      assert_not rating.detractor?
    end
  end

  test "detractor returns false if score is less than 0" do
    rating = Rating.new(score: -1)
    rating.detractor?
    assert_not rating.detractor?
  end

  test "uptade person score cache when created" do
    person = people(:one)
    person.ratings.create(score: 9)
    assert_equal 9, person.score
  end
end
