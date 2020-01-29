class MessagesController < ApplicationController

  def index
    group = Group.find(params[:group_id])
    @message = group.messages
    json_response(@message)
  end

  def show
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.create!(message_params)
    json_response(@message)
  end

  def update
    @message = Message.find(params[:id])
      if @message.update(message_params)
        render status: 200, json: {
       message: "Nice job on the update, Bruh"
       }
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy!
      render status: 200, json: {
          message: "You killed it Son!!"
        }
      end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def message_params
    params.permit(:group_id, :content, :author)
  end
end
