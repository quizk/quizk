module Ops
  class TopicsController < BaseController
    before_action :set_topic, only: %i[show edit update destroy]

    def index
      @topics = Topic.page(params[:page])
    end

    def show; end

    def new
      @topic = Topic.new
    end

    def edit; end

    def create
      @topic = Topic.new(topic_params)

      if @topic.save
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash[:error] = @topic.errors.full_messages.join(', ') }
        end
      end
    end

    def update
      if @topic.update(topic_params)
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash[:error] = @topic.errors.full_messages.join(', ') }
        end
      end
    end

    def destroy
      @topic.destroy
      respond_to do |format|
        format.turbo_stream
      end
    end

  private

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name)
    end
  end
end
