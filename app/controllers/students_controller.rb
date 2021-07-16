class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    def show
        render json: @student
        # render json: { student: student}
    end
    def index
        @student = Student.new
        @students = Student.all
        render json: @students
        # @student = Student.find(params[:id])
    end
    def new
      
        @student = Student.new
        if params[:errors].present?
           @errors = params[:errors]
        end
    end
    def edit
       
    end
    def create
        
        @student =  Student.new(student_params)
        if @student.save
            render json: @student
            # flash[:notice] = "Student was created successfully."  


        # redirect_to student_path(@student)

        #    redirect_to students_path

        #     # redirect_to 'index'
        else
            render json: @student.errors
            # redirect_to new_student_path(errors: @student.errors.full_messages)
        #     # @errors= @student.errors
        #     #  flash[:alert] = @errors.full_messages
        #     # redirect_back fallback_location: root_path
         end
    end
#     def create
#         # render plain: params[:student]
#         @student =  Student.new(student_params)
#         redirect_to do |format|
#           if @student.save
#             flash[:notice] = "Student was created successfully."
#             format.js 
#         # redirect_to student_path(@student)
#         #    redirect_to students_path
#             # redirect_to 'index'
#         else
#             format.js
#             # flash[:now] = "Student creation failed."
#             # render 'index'
#         #    redirect_to students_path
#         # format.json { render json: @student.errors }
#             #  render json: { errors: student.errors }
#         end
#     end
   
# end
    def update
         
         if @student.update(student_params)
            flash[:notice] = "Student was updated successfully."
            render json: @student
         else
            render json: @student.errors
         end
    end
    def  destroy
        
        @student.destroy
        flash[:notice] = "Student was deleted successfully."
        msg = {:status => "ok", :message => "Successfully deleted!"}
        render :json => msg 
    end

private

    def set_student
        @student = Student.find(params[:id]) 
    end
    def student_params
        params.require(:student).permit(:name,:gender,:date_of_birth,:email,:uuid)
    end
end