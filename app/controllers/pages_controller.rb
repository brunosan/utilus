class PagesController < ApplicationController
  def home
    offset=rand(Question.count)
    @question=Question.first(:offset => offset)
    @feed=@question.answers
    @answer=Answer.new(:question => @question)

  end

  def contact
  end

  def about
  end

end
