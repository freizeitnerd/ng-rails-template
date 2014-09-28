class TemplatesController < ApplicationController
  #TODO: Add caching
  def show
    render :partial => params[:filename], layout: false    # params[:filename] is secured based on TemplateConstraint
  end
end
