class SubjectsController < ApplicationController
        before_action :set_subject, only: [:show, :edit, :update, :destroy]
        def show
            render json: @subject
        end
        def index
            @subject = Subject.new
            @subjects = Subject.all
              render json: @subjects
        end
        def new
            @subject = Subject.new
        end
        def edit
           
        end
        def create
            
            # render plain: params[:student]
            @subject =  Subject.new(subject_params)
            if @subject.save
                flash[:notice] = "Subject was created successfully."
            # redirect_to student_path(@student)
            render json: @subject
            else
                render json: @subject.errors
            end
        end
        def update
             
             if @subject.update(subject_params)
                flash[:notice] = "Subject was updated successfully."
                render json: @subject
             else
                render json: @subject.errors
             end
        end
        def  destroy
            
            @subject.destroy
            flash[:notice] = "Subject was deleted successfully."
            # redirect_to subjects_path
            msg = {:status => "ok", :message => "Successfully deleted!"}
        render :json => msg 
        end
    
    private
    
        def set_subject
            @subject = Subject.find(params[:id]) 
        end
        def subject_params
            params.require(:subject).permit(:name,:uuid)
        end
    
end