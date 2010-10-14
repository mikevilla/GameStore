module HomeHelper

  def my_currency_helper ( number )
    if number > 20
      number_to_currency (number)
    else
      number_to_currency (number) + "  *** Special ***"
    end
  end
end
