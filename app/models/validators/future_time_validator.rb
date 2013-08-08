class FutureTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.new_record? && value.present? && value.in_time_zone > Time.zone.now
      record.errors.add attribute, (options[:message] || "must be a future time")
    end
  end
end
