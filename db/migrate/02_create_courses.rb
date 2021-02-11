class CreateCourses < ActiveRecord::Migration[5.2]
    def change
        create_table :courses do |t|
            t.string :course_name
            t.string :subject
            t.string :status
            t.string :url
            t.integer :user_id

            t.datetime :created_at
            t.datetime :updated_at
        end
    end
end