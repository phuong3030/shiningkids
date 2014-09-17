module ApplicationHelper
  def currency(money)
    if I18n.locale == :en
      '$' + money.to_s
    else 
      money.to_s + ' VND'
    end
  end
end
