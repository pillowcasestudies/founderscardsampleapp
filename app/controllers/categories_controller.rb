class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  # AJAX action
  def experiences
    category = Category.find(params[:id])
    @experiences = category.experiences
    respond_to do |format|
      format.json { render json: @experiences.as_json(only: [:id, :venue_name, :description]) }
    end
  end
end