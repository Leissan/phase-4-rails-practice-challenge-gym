class MembershipsController < ApplicationController


    def create
        
        membership = Membership.create(
            gym_id: params[:gym_id],
            client_id: params[:client_id],
            charge: params[:charge]
        )

        if membership.valid?
            render json: membership, status: :created
        else
            render json: {error: membership.errors.full_messages}
        end
    end

end