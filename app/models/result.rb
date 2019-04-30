class Result < ApplicationRecord
  def data
    [
      call_id,
      lead_id,
      lead_type,
      agent_name,
      creation_date,
      finish_date,
      result,
      comment,
      app_number
    ]
  end
end
