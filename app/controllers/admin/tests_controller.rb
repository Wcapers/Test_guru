class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline]

  def index
    @tests = Test.all
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def new
    @test = current_user.tests.new
  end

  def create
     @test = current_user.tests_author.new(test_params)
     if @test.save
      redirect_to admin_tests_path(@test), notice: t('.success')
    else
      flash[:error] = t('fail')

      redirect_to new_admin_test_path
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('success')
    else
      render 'edit'
   end
  end

  def destroy
      @test.destroy
      redirect_to admin_tests_path, notice: t('success')
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
