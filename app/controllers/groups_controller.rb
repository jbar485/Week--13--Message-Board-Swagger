class GroupsController < ApplicationController

  def index
    @groups = Group.all
    json_response(@groups)
  end

  def show
    @group = Group.find(params[:id])
    json_response(@group)
  end

  def create
    @group = Group.create!(group_params)
    json_response(@group)
  end

  def update
    @group = Group.find(params[:id])
      if @group.update(group_params)
        render status: 200, json: {
       group: "Nice job on the update, Bruh"
       }
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy!
      render status: 200, json: {
          group: "You killed it Son!!"
        }
      end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def group_params
    params.permit(:name, :genre)
  end
end
