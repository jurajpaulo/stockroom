class StockMailer < ActionMailer::Base
  default :from => Frec::Application.config.action_mailer_default_from

  def critical_stock_level_reached(stock)
      @stock = stock
      
      mail(:to => Stockroom::Application.config.critical_level_email,
           :subject => 'Critical stock level reached'
      ) do |format|
            format.html { render 'critical_stock_level_reached' }
      end
  end

end
