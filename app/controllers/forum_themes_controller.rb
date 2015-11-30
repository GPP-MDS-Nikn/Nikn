class ForumThemesController < ApplicationController
  # Use this controller as a resource of CanCan and Rolify
  load_and_authorize_resource

  include ApplicationHelper
	PAGINATION_RANGE = 5

  def index
    # Get last forum topics
    ungrouped_last_forum_topics = get_last_forum_topics(9)
    # Group the last forum topics in specified sub-lists.
    # To see the method structure, go to the application helper.
    @grouped_last_forum_topics = create_list_groups(ungrouped_last_forum_topics, 3)
    @forum_themes = ForumTheme.all
  end

  def show

    set_forum_theme
    # If the user is searching for something, returns the result of the research
    if params[:search]
      @forum_topics = @forum_theme.forum_topics.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: PAGINATION_RANGE)
    else
      @forum_topics = @forum_theme.forum_topics.all.order('created_at DESC').paginate(page: params[:page], per_page: PAGINATION_RANGE)
    end
    number_of_pages = (@forum_topics.count.to_f / PAGINATION_RANGE.to_f).ceil
    @pages = 1..number_of_pages
    @page = params[:page]
    @page ||= 1
    logger.debug "Quantity of paginated topics: #{ @forum_topics.count }."
    logger.debug "Number of pages: #{ number_of_pages }."
    logger.debug "Current page: #{ @page }."
  end

  def new
    @forum_theme = ForumTheme.new
  end

  def create
    @forum_theme = ForumTheme.new(forum_theme_params)

    if @forum_theme.save
        redirect_to '/forum_themes'
    else
        render 'new'
    end
  end

  def edit
    set_forum_theme
  end

  def update
    set_forum_theme
    if @forum_theme.update(forum_theme_params)
      flash[:success] = "Tema atualizado!"

      redirect_to @forum_theme
    else
      render :edit
    end
  end

  def destroy
    set_forum_theme
    @forum_theme.destroy
    redirect_to forum_themes_path
  end

  private
    # Method to get some forum topics
    def get_last_forum_topics(quantity)
      return ForumTopic.order(created_at: :desc).limit(quantity)
    end

    # Method to take a ForumTheme with a specified identifier
    def set_forum_theme
      @forum_theme = ForumTheme.find(params[:id])
    end

    def forum_theme_params
        params.require(:forum_theme).permit(:title, :description, :image_file)
    end
end
