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
        redirect_to @topic, notice: t('flashes.created')
      else
        flash[:error] = @topic.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @topic.update(topic_params)
        redirect_to @topic, notice: t('flashes.updated')
      else
        flash[:error] = @topic.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @topic.destroy
      redirect_to topics_path, notice: t('flashes.deleted')
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
