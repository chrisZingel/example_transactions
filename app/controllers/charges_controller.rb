class ChargesController < ApplicationController

  # GET /charges
  # GET /charges.json
  def index
    @successful = Transaction.successful

  end

end
