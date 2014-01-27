class AddAvailabilityToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :availability, :integer
  end
end
