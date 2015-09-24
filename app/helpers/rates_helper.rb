module RatesHelper
  # not working
  def rate_to_button(rate)
      link_to rate.severity, rate_path(id: rate.id), class: 'btn-xs btn-primary'
  end
end
