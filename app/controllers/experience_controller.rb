class ExperienceController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  # GET /experiences
  def index
    @categories = Category.all
    @experiences = Experience.includes(:category).all

    if params[:search].present?
      q = "%#{params[:search]}%"
      @experiences = @experiences.where("venue_name LIKE ? OR description LIKE ?", q, q)
    end

    if params[:category_id].present?
      @experiences = @experiences.where(category_id: params[:category_id])
    end

    if params[:min_price].present?
      @experiences = @experiences.where("price >= ?", params[:min_price])
    end

    if params[:max_price].present?
      @experiences = @experiences.where("price <= ?", params[:max_price])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb (for AJAX updates)
    end
  end

  def show; end
  def new; @experience = @category.experiences.new; end

  def create
    @experience = @category.experiences.new(experience_params)
    if @experience.save
      redirect_to @experience, notice: "Experience created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      redirect_to @experience, notice: "Experience updated successfully."
    else
      render :edit
    end
  end

def filter
  experiences = Experience.all
  experiences = experiences.where(category_id: params[:category_id]) if params[:category_id].present?
  experiences = experiences.where("venue_name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  experiences = experiences.where("price >= ?", params[:min_price]) if params[:min_price].present?
  experiences = experiences.where("price <= ?", params[:max_price]) if params[:max_price].present?
  experiences = experiences.where("city LIKE ?", "%#{params[:city]}%") if params[:city].present?

  render json: experiences.as_json(
    only: [:id, :venue_name, :description, :price, :image_url, :city, :booking_link]
  )
end

  def destroy
    @experience.destroy
    redirect_to experiences_path, notice: "Experience deleted."
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id])
    redirect_to experiences_path, alert: "Category not found." unless @category
  end

  def set_experience
    @experience = Experience.find_by(id: params[:id])
    redirect_to experiences_path, alert: "Experience not found." unless @experience
  end

  

  def experience_params
    params.require(:experience).permit(
      :description, :city, :state, :country, :start_date, :end_date,
      :duration, :price, :membership_required, :discount_available,
      :capacity, :venue_name, :booking_link, :image_url, :tags,
      :rating, :featured, :category_id
    )
  end
end
