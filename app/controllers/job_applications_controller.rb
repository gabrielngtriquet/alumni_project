class JobApplicationsController < ApplicationController
  def index
    if current_user
      @job_applications = current_user.job_applications
    else
      redirect_to login_path, alert: "You must be logged in to view job applications."
    end
  end
  

  def show
    the_id = params.fetch("path_id")

    matching_job_applications = JobApplication.where({ :id => the_id })

    @the_job_application = matching_job_applications.at(0)

    render({ :template => "job_applications/show" })
  end

  def create
    the_job_application = JobApplication.new
    the_job_application.personal_statement = params.fetch("query_personal_statement")
    the_job_application.resume = params.fetch("query_resume")
    the_job_application.user_id = current_user.id  # Use current_user.id here
    the_job_application.job_posting_id = params.fetch("query_job_posting_id")
  
    if the_job_application.save
      redirect_to job_posting_path(the_job_application.job_posting_id), notice: "Application submitted successfully."
    else
      render :new, alert: "Failed to submit application."
    end
  end
  

  def update
    the_id = params.fetch("path_id")
    the_job_application = JobApplication.where({ :id => the_id }).at(0)

    the_job_application.personal_statement = params.fetch("query_personal_statement")
    the_job_application.resume = params.fetch("query_resume")
    the_job_application.user_id = params.fetch("query_user_id")
    the_job_application.job_posting_id = params.fetch("query_job_posting_id")

    if the_job_application.valid?
      the_job_application.save
      redirect_to("/job_applications/#{the_job_application.id}", { :notice => "Job application updated successfully."} )
    else
      redirect_to("/job_applications/#{the_job_application.id}", { :alert => the_job_application.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job_application = JobApplication.where({ :id => the_id }).at(0)

    the_job_application.destroy

    redirect_to("/job_applications", { :notice => "Job application deleted successfully."} )
  end
end

private

def set_job_posting
  @job_posting = JobPosting.find(params[:job_posting_id])
end

def job_application_params
  params.require(:job_application).permit(:cover_letter, :status)
end
