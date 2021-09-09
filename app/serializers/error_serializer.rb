class ErrorSerializer
  def self.error_object
    {
      data: {
        id: 'nil',
        attributes: {}
      }
    }
  end
  def self.error
    {
      error: 'nil'
    }
  end
end
