class CreateCompletedTotalLectures < ActiveRecord::Migration[5.2]
    def change
        add_column :courses, :completed_lectures, :integer
        add_column :courses, :total_lectures, :integer
    end
end