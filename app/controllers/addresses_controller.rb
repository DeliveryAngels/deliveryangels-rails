class AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    @address = current_user.build_address
  end

  def create
    @address = current_user.build_address(address_params)

    if @address.save
      redirect_to new_order_path
    else
      @user = current_user
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :first_line, :second_line, :city, :postcode
    )
  end

end
