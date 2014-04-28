class Event
  include ActiveModel::SerializerSupport
  attr_accessor :name, :location

  def initialize(params={})
    params.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end
