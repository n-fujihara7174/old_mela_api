class ActiveRecord::Base
  def extraction_error_message
    error_messages = {}
    errors.each{|key, value|
        error_messages[key] = value
    }
    error_messages
  end
end