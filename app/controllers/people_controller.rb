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

    if @person.save
      redirect_to @person
    else
      redirect_to home_index_path
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      @person.update(:bmi=>bmi_calculator, :prediction=>dog_or_cat)
      redirect_to @person
    else
      redirect_to home_index_path
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to home_index_path
  end

  private
  def bmi_calculator
    @person[:bmi] = ( (@person[:weight].to_f)/(@person[:height].to_f * @person[:height].to_f) ) * 703
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
