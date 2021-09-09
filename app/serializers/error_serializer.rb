class ErrorSerializer
  def self.error_object
    {
      data: {
        id: 'nil',
        attributes: {}
      }
    }
  end
  def self.error(message)
    {
      error: message
    }
  end
end
