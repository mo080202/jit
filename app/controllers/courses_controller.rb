class CoursesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @courses = Course.order(sort_column + " " + sort_direction)
  end
  def show
    session[:course_id] = params[:id]
    @course = Course.find(params[:id])
    @courseterms = @course.terms.order('termname ASC')
    @terms = Term.all


    respond_to do |format|
      format.html do
        if params[:download].present?
          response.headers["content-disposition"] = "attachment; filename=important.html"
          render "simple_html", layout: nil
        end
      end
      format.json do
        data = @courseterms.map do |t|
          {
            id: t.id,
            term: t.termname,
            type: 'html'
          }
        end
        if params[:download].present?
          send_data JSON.generate(data), filename: 'input.json'
        else
          render json:data
        end
      end
    end
  end
  def new
    @course = Course.new
  end
  def create
    course = Course.create(course_params)
    redirect_to courses_path
  end
  def edit
    @course = Course.find(params[:id])
  end
  def update
    course = Course.find(params[:id])
    course.update!(course_params)
    redirect_to courses_path
  end
  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to courses_path
  end

  private
  def course_params
    params.require(:course).permit(:coursename, :coursetitle)
  end
  def sort_column
    Course.column_names.include?(params[:sort]) ? params[:sort] : "coursename"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
