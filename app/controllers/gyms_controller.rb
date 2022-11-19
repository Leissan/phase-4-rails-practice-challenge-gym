class GymsController < ApplicationController

    def show
        gym = Gym.find_by(id: params[:id]) #will return nil instead of error if the gym doesnt exist (find will error out)
        if gym
            render json: gym, status: :found
        else
            render json: {error: "Gym not found"}, status: :not_found
        end
    end

    def destroy
        gym = Gym.find_by(id: params[:id]) 
        if gym
            gym.destroy
            head :no_content
        else
            render json: {error: "Gym not found"}, status: 404
        end

    end
end
