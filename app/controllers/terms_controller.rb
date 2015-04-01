class TermsController < ApplicationController
  def index
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
  private
  def term_params
    params.require(:term).permit(:termname, :definition)
  end
end
