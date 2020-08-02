class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = current_user.tests.new
  end

  def create
     @test = current_user.tests_author.new(test_params)
     if @test.save
      redirect_to admin_tests_path(@test)
    else
      redirect_to new_admin_test_path
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render 'edit'
   end
  end

  def destroy
    def destroy
      @test.destroy
      redirect_to admin_tests_path
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
