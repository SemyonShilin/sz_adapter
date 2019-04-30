class WebhooksController < ApplicationController
  def receive
    if Result.create(mapping(params))
      render status: 200
    else
      render status: :bad_request
    end
  end

  private

  def mapping(params)
    {
      call_id: params.dig(:call, :id),
      lead_id: params.dig(:lead, :id),
      lead_type: 'Lead',
      agent_name: '',
      creation_date: params.dig(:lead, :created_at),
      finish_date: params.dig(:call, :ended_at),
      result: params.dig(:call_result, :result_name),
      comment: params.dig(:call_result, :comment),
      app_number: ''
    }
  end
end
