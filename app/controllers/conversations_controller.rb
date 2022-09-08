class ConversationsController < ApplicationController
  skip_before_action(:verify_authenticity_token)
  before_action(:set_conversation, only: %i[ show ])
  def index
    @users = User.all
    @conversations = Conversation.all

    render json: {
             data: {
               users: @users,
               conversations: @conversations
             }
           }, status: :ok
  end


  def new
    @conversation = Conversation.new
  end

  def show
    @conversation
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end
end
