module ApplicationHelper
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end 

  def nome_application
    "CRYPTO_WALLET"
  end
end
