class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :imco_id
      t.string :cct
      t.string :name
      t.string :address
      t.string :between_street_1
      t.string :between_street_2
      t.string :suburb
      t.string :zip_code
      t.string :phone_number
      t.string :phone_extension
      t.string :fax
      t.string :fax_extension
      t.string :email
      t.string :web_page
      t.float  :altitude
      t.float  :longitude
      t.float  :latitude
      t.string :kind
      t.string :grade
      t.string :shift
      t.string :state_rank
      t.string :city_rank
      t.text :enlace_results
      t.integer :total_students, default: 0
      t.integer :total_evaluated_students, default: 0
      t.string :educational_semaphore
      t.integer :total_teachers, default: 0
      t.string :grade_by_parents
      t.float :budget, default: 0
      t.integer :availability, default: 0
      t.integer :max_availability, default: 0
      t.string :level
      t.text :contact_info

      t.timestamps
    end
  end
end
