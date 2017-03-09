class ContentsController < ApplicationController
  before_action :authenticate_user!
  layout 'af_log'
  def content
  end

end
