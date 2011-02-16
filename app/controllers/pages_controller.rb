class PagesController < ApplicationController
  def home
    total_questions=Question.count
    @question=Question.find(rand(total_questions-1)+1)
    @feed=@question.answers
    @answer=Answer.new(:question => @question)

  end

  def contact
  end

  def about
  end

end
