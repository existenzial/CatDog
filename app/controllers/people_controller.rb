class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)

    @person.update(:bmi=>bmi_calculator, :prediction=>dog_or_cat)
    puts "This is your bmi  #{@person[:bmi]}"

    if @person.save
      redirect_to @person
    else
      redirect_to home_index_path
    end
  end

  private
  def bmi_calculator
    bmi =  @person[:weight]/(@person[:height] * @person[:height]) * 703
    # bmi = 19
    @person[:bmi] = bmi
    puts "This is your bmi after calculation  #{@person[:bmi]}"
  end

  private
  def dog_or_cat
    if @person[:bmi] > 25 || @person[:bmi] < 18
      @person[:prediction] = 'cat'
    else
      @person[:prediction] = 'dog'
    end
  end

  private
  def person_params
    params.require(:person).permit(:height, :weight)
  end

end
