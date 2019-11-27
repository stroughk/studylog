class StudiesController < ApplicationController
    
    def index
        @studies = Study.all
    end
    
    
    def new
        @study = Study.new
    end

    def edit
        @study = Study.find(params[:id])
    end

    def create
      #  render plain: params[:study].inspect
        @study = Study.new(study_params)
        if @study.save
            flash[:notice] = "Your study was logged successfully!"
            redirect_to study_path(@study)
        else 
            render 'new'
        end
    end

    def update
        @study = Study.find(params[:id])
        if @study.update(study_params)
            flash[:notice] = "Study was successfully updated"
            redirect_to study_path(@study)
        else
            render 'edit'
        end
    end

    def show
        @study = Study.find(params[:id])
    end

    private

    def study_params
        params.require(:study).permit(:programming_language, :topic, :source, :description)
    end
   

end
