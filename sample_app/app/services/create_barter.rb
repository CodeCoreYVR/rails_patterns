class CreateBarter

  def self.call(barter_params)
    @barter = Barter.new(barter_params)

    if @barter.save
      UserMailer.barter_posted(@barter).deliver
    end

    @barter
  end
end
