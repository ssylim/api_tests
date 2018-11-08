class User
  attr_accessor :address, :first_name, :last_name

  def initialize
    @first_name = 'Takeshi'
    @last_name = 'Yamamamoto'
    @address = [UserAddress.new]
  end

  def self.to_json
    JSON.generate(self)
  end
end