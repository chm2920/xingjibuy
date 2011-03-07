class TopicCategoriesController < ApplicationController

  def show
    @topic_category = TopicCategory.find_by_url(params[:id])
    @topics = @topic_category.topics.paginate :page => params[:page], :per_page => 10, :order => "id desc"
  end

end
