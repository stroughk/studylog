class StudiesController < ApplicationController
    before_action :set_study, only: [:edit, :update, :show, :destroy]

    def index
        @studies = Study.all
    end
    
    
    def new
        @study = Study.new
    end

    def edit
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
        if @study.update(study_params)
            flash[:notice] = "Study was successfully updated"
            redirect_to study_path(@study)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @study.destroy
        flash[:notice] = "This study was successfully deleted"
        redirect_to studies_path
    end

    private

    def study_params
        params.require(:study).permit(:programming_language, :topic, :source, :description)
    end
   
    def set_study
        @study = Study.find(params[:id])
    end

end
