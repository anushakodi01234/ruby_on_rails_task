class MarksController < ApplicationController
    before_action :set_mark, only: [ :edit,]
    def show
        # @mark = Mark.find(:all, :conditions => { :student_id => params[:id] })
        all_records = Mark.where(:student_id => params[:id])
        @mark = all_records.includes(:subject).group_by(&:student_id)
       
    end
    def index
        # @mark = Mark.new
       
        # @students = Student.all
        # @subjects = Subject.all
        student_marks = Mark.includes(:student, :subject).all.group_by(&:student_id)
        @marks = []
      student_marks.each do |student_id, marks|
      student = marks[0].student
      marks_sum = marks.pluck(:marks).compact.sum
      status = marks.any? {|m| m.status == "Fail"} ? "Fail" : "Pass"
      @marks << {  student_id: student.id, student_name: student.name,marks: marks_sum, status: status }
     
         end
        #  respond_to do |format|
        #     format.html
        #     format.json { render json: @marks, include: ['subjects']}
        #  end
          render json: @marks,include: ['subjects']
    end
    def new
        @mark = Mark.new
    end
    def edit
       
       @student = @mark.student
    
    end
    def create
        
        @student = Student.find(mark_params[:student_id])
          params[:mark][:subject_marks].each do |key,value|
             @mark = @student.marks.find_or_initialize_by(subject_id: key)
             @mark.marks = value
             if @mark.save 
                flash[:notice] = "Mark was created successfully."
            else
                flash[:alert] =   @mark.errors.full_messages
             end
    end
  
    render json: @mark.student
end
    def update

    
        @student = Student.find(mark_params[:student_id])
         
        params[:mark][:subject_marks].each do |key,value|
           @mark = @student.marks.find_or_initialize_by(subject_id: key)
           @mark.marks = value
           if @mark.save
              flash[:notice] = "Mark was updated successfully."
              
          else
              flash[:alert] =  @mark.errors.full_messages
              
           end
        end

        # redirect_to marks_path
        render json: @mark.student
        
    end
    def  destroy
        
        Mark.where(student_id: params[:id]).destroy_all
        
        flash[:notice] = "Mark was deleted successfully."
        # redirect_to marks_path
        msg = {:status => "ok", :message => "Successfully deleted!"}
        render :json => msg 
    end

private

    def set_mark
        @mark = Mark.find_by(student_id: params[:id]) 
    end
    def mark_params
        params.require(:mark).permit(:student_id)
    end

end 