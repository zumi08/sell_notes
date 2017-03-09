class ContentsController < ApplicationController
  before_action :authenticate_user!
  layout 'af_log'
  def content
    if params[:some].present? && lookup_context.exists?("#{params[:some]}", "contents")
      binding.pry
      return render action: "#{params[:some]}", layout: 'af_log'
    elsif params[:certain].present? && lookup_context.exists?("#{params[:certain]}", "contents/#{params[:symbol]}")
      return render action: "#{params[:symbol]}/#{params[:certain]}", layout: 'qualification'
    end
  end

end
