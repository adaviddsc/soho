class JobController < ApplicationController
  def index
    @article_all = current_user.jobs
  	render :template => "selves/announce"
  end

  def new
  	@job = Job.new
    @article_all = current_user.jobs
    @job_action = "create"
  	render :template => "selves/announce"
  end

  def create
  	params[:job]["user_id"] = current_user.id
  	if Job.new(job_params).save
  	  redirect_to new_self_job_path
  	else
  	  render :text => "fail"
  	end
  end

  def edit
    @job = Job.find(params[:id])
    @article_all = current_user.jobs
    if @job.user_id == current_user.id
      @job_action = "update"
      render :template => "selves/announce"
    else
      redirect_to :root
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to edit_self_job_path
  end

  def destroy
    JobImg.destroy_all(:job_id => params[:id])
    JobBrowse.destroy_all(:job_id => params[:id])
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to new_self_job_path
  end

  def browse
    browse = JobBrowse.find_by(:job_id => params[:job_id], :user => current_user.email)
    if browse.nil? && current_user
      JobBrowse.new(:job_id => params[:job_id], :user => current_user.email).save
    end
  end

private
  def job_params
  	params.require(:job).permit(:user_id, :workCategory, :jobContent, :jobDetail, job_imgs_attributes: [:id, :order, :image, :_destroy])
  end
end
