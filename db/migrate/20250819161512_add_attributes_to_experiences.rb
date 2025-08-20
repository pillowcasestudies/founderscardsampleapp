class AddAttributesToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :description, :text
    add_column :experiences, :city, :string
    add_column :experiences, :state, :string
    add_column :experiences, :country, :string
    add_column :experiences, :start_date, :date
    add_column :experiences, :end_date, :date
    add_column :experiences, :duration, :string
    add_column :experiences, :price, :decimal, precision: 10, scale: 2
    add_column :experiences, :membership_required, :boolean, default: false
    add_column :experiences, :discount_available, :boolean, default: false
    add_column :experiences, :capacity, :integer
    add_column :experiences, :venue_name, :string
    add_column :experiences, :booking_link, :string
    add_column :experiences, :image_url, :string
    add_column :experiences, :tags, :string
    add_column :experiences, :rating, :float
    add_column :experiences, :featured, :boolean, default: false
  end
end
