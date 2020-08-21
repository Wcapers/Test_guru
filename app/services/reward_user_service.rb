class RewardUserService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if self.send("#{badge.rule}?", badge.operand)
    end
  end



  def all_level_tests_complete? (level)
    level = level.to_i
    @test_passage.test.level == level && @test_passage.success? &&
     @user.tests.where("level = ?", level).uniq.count == Test.where("level = ?", level).count
  end

  def all_category_tests_complete? (category_id)
    category = category_id.to_i
    @test_passage.test.category_id == category && @test_passage.success? &&
     @user.tests.where("category_id = ?", category).uniq.count == Test.where("category_id = ?", category).count
  end

  def first_try_complete? (title)
     @test_passage.test.title == title && @test_passage.success? && @user.tests.where("title = ?", @test_passage.test.title).count == 1
  end

  def reward(badge)
   @user.badges << badge
  end
end
