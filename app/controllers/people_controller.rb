class PeopleController < ApplicationController

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
  def person_params
    params.require(:person).permit(:height, :weight)
  end

end
