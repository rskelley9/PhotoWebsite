class ServiceRequestMailer < ActionMailer::Base

  def contact(service_request)
    @service_request = service_request
    @photographer = Photographer.cached
    mail( :from => @photographer.email, :to => @photographer.email, :subject => "Hirschthal Photo Service Request: #{@service_request.name}")
  end

end