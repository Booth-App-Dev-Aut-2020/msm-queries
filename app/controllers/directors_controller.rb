class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render ({ :template => "director_templates/index.html.erb"})
  end

  def wisest
    @eldest = Director.order({:dob => :asc}).where.not({:dob=>nil}).at(0)
    render ({ :template => "director_templates/eldest.html.erb"})
  end

  def freshest
    @youngest = Director.order({:dob => :desc}).where.not({:dob=>nil}).at(0)
    render ({ :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    the_id = params.fetch("dir_id")
    @dir = Director.where({:id=>the_id}).at(0)
    render ({ :template => "director_templates/show.html.erb"})
  end

end 