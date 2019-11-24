class StudiesController < ApplicationController
    def new
        @study = Study.new
    end

    def create
      #  render plain: params[:study].inspect
        @study = Study.new(study_params)
        @study.save
        redirect_to study_show(@study)
    end

    private

    def study_params
        params.require(:study).permit(:programming_language, :topic, :source, :description)
    end
   

end
