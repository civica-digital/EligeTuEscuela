class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
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
      t.string :enlace_results
      t.string :total_students
      t.string :total_evaluated_students
      t.string :educational_semaphore
      t.string :total_teachers
      t.string :grade_by_parents
      t.string :budget

      t.timestamps
    end
  end
end
