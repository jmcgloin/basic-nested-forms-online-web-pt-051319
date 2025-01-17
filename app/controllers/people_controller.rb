class PeopleController < ApplicationController
  def new
    @person = Person.new
    @person.addresses.build(address_type: "Work")
    @person.addresses.build(address_type: "Home")
  end

  def create    
    Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
