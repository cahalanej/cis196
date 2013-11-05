class Todo < ActiveRecord::Base
	scope :incomplete, -> { where(completed: false).order(:title)}
	scope :high_priority, -> { where('priority = ?', "high")}
	scope :med_priority, -> { where('priority = ?', "medium")}
	scope :low_priority, -> { where('priority = ?', "low")}
  belongs_to :Tasklist
  attr_accessible :completed, :description, :priority, :title, :Tasklist_id
end
