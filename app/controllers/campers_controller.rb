class CampersController < ApplicationController
    def index
        campers = Camper.ActivitiesController
        render json: campers
    end

    def show 
        camper = find_camper
        if camper 
            render json: camper
        else
            camper_not_found
        end
    end

    def create
        camper = Camper.create(params.permit(:name, :age))
        render json: camper, status: :created
    end

    private 

    def campers_params
        params.permit(:name, :age)
    end

    def camper_not_found
        render json: {error: 'Camper not found'}, status: :not_found
    end

    def find_camper
        Camper.find_by(id: params[:id])
    end
end