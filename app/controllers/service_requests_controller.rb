class ServiceRequestsController < ApplicationController

  def new
    @meta_title = "Request Appointment from #{photographer.name}"
    respond_with( @service_request = ServiceRequest.new )
  end

  def create
    @service_request = ServiceRequest.create(params[:service_request])
    if @service_request.valid?
      # Send the email
      begin
        ServiceRequestMailer.contact(@service_request).deliver
        respond_with(@service_request, :location => thanks_service_requests_path)
      rescue Exception => e
        redirect_to root_path, :alert => "There was a problem submitting your request for a photography appointment. Please contact Stephen Hirschthal directly at: #{Photographer.cached.email} or  #{Photographer.cached.phone}"
      end
    else
      respond_with @service_request
    end
  end

  def thanks
  end
end
