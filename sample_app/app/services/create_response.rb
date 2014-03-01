class CreateResponse

  def self.call(*args)
    new(*args).call
  end

  def initialize(original_barter, barter_params)
    @original_barter = original_barter
    @barter_params = barter_params
  end

  def call
    @barter = Barter.new(@barter_params)
    @barter.barter_id = @original_barter.id

    if @barter.save
      UserMailer.barter_posted(@barter).deliver
      UserMailer.barter_response(@barter, @original_barter)
    end

    @barter

  end
end
