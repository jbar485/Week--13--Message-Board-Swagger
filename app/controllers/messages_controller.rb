class MessagesController < ApplicationController

  def index
    @messages = Message.all
    json_response(@messages)
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
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
    params.permit(:user_id, :content)
  end
end
