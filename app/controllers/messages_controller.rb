class MessagesController < ApplicationController
    before_action :is_owner?, only: [:destroy]

    def create
        message = Message.new(message_params)
        if message.save
            flash[:success] = "メッセージを投稿しました"
            redirect_back fallback_location: root_url
        else
            flash[:danger] = "空メッセージは送信できません"
        end
    end

    def destroy
        if @message.destroy
            flash[:success] = "メッセージを削除しました"
            redirect_back fallback_location: root_url
        else
            flash[:notice] = "メッセージを削除できませんでした"
            redirect_back fallback_location: root_url
        end
    end

    private
        def message_params
            params.require(:message).permit(:content, :user_id, :group_id)
        end

        # メッセージのオーナーかどうか
        def is_owner?
            @message = Message.find_by(id: params[:id])
            redirect_to root_url unless @message.user_id == current_user.id
        end
end
