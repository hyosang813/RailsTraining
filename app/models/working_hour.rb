class WorkingHour
  include Mongoid::Document
  include Mongoid::Timestamps

  field :work_time, type: Time
  field :leave_time, type: Time

  belongs_to :user
end
