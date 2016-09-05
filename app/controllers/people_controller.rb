class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Article.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person
    else
      render 'home'
    end
  end

  private
  def bmi_calculator
    @person = Person.find(params[:id])
    bmi = ( @person[:weight]/(@person[:height] * @person[:height]) ) * 703
    @person[:bmi] = bmi
    @person.save
  end

  private
  def dog_or_cat
    @person = Person.find(params[:id])
    if @person[:bmi] > 25 || @person[:bmi] < 7
      @person[:prediction] = 'cat'
    else
      @person[:prediction] = 'dog'
    end
    @person.save
  end

  private
  def person_params
    params.require(:person).permit(:height, :weight)
  end

end
