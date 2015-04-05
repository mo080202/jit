class TermsController < ApplicationController
  def index
    @terms = Term.all
  end
  def addterms
    @terms = Term.all
  end
  def new
    @term = Term.new
  end
  def create
    term = Term.create(term_params)
    redirect_to terms_path
  end
  def edit
    @term = Term.find(params[:id])
  end
  def update
    term = Term.find(params[:id])
    term.update!(term_params)
    redirect_to terms_path
  end
  def destroy
    term = Term.find(params[:id])
    term.destroy
    redirect_to terms_path
  end
  def add
    term = Term.find(params[:id])
    term.termlists.create!(course_id: current_course.id)
    redirect_to '/add'
  end
  def remove
    term = Term.find(params[:id])
    term.termlists.where(course_id: current_course.id).delete_all
    redirect_to '/add'
  end
  private
  def term_params
    params.require(:term).permit(:termname, :definition)
  end
  def has_not_added?(term)
    term.termlists.where(course_id: current_course.id).empty?
  end
  helper_method :has_not_added?
end
