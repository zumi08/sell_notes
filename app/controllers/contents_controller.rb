class ContentsController < ApplicationController
  before_action :authenticate_user!
  layout 'af_log'
  def content
    university_id = current_user.college.university_id
    college_info_ids = University.find(university_id).colleges.pluck(:id)
    @lecture_informations = LectureInformation.where(college_id: college_info_ids).order("created_at DESC").limit(7)
    @new_notes = Item.where(college_id: college_info_ids).order("created_at DESC").limit(7)

    if params[:some].present? && lookup_context.exists?("#{params[:some]}", "contents")
      return render action: "#{params[:some]}", layout: 'af_log'
    elsif params[:certain].present? && lookup_context.exists?("#{params[:certain]}", "contents/#{params[:symbol]}")
      return render action: "#{params[:symbol]}/#{params[:certain]}", layout: 'qualification'
    end
  end

end
