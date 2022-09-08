class MessagesController < ApplicationController
  before_action :set_message
  skip_before_action(:verify_authenticity_token)

  # GET /messages or /messages.json
  def index
    # only return messages within the past 30 days by most recent
    @messages = @conversation.messages.where('created_at > ?', 30.days.ago).limit(100).order!('created_at DESC')
    render json: {
             data: @messages
           }
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = @conversation.messages.new
  end

  # POST /messages or /messages.json
  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      render json: @conversation, status: :ok
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @conversation = Conversation.find(params[:conversation_id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :user_id)
    end
end
