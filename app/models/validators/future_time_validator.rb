class FutureTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "must be a future time") unless
    value.present? && value.in_time_zone > Time.zone.now
  end
end
