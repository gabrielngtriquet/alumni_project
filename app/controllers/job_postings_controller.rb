class JobPostingsController < ApplicationController
  def index
    matching_job_postings = JobPosting.all

    @list_of_job_postings = matching_job_postings.order({ :created_at => :desc })

    render({ :template => "job_postings/index" })
  end

  def show
    @the_job_posting = JobPosting.find(params[:id]) # Ensure the record exists and the ID is passed
  rescue ActiveRecord::RecordNotFound
    redirect_to job_postings_path, alert: "Job posting not found."
  end
end

  def create

    the_job_posting = JobPosting.new
    the_job_posting.company = params.fetch("query_company")
    the_job_posting.sector_of_occupation = params.fetch("query_sector_of_occupation")
    the_job_posting.compensation = params.fetch("query_compensation")
    the_job_posting.user_id = current_user.id
    the_job_posting.job_applications_count = params.fetch("query_job_applications_count")

    if the_job_posting.valid?
      the_job_posting.save
      redirect_to("/job_postings", { :notice => "Job posting created successfully." })
    else
      redirect_to("/job_postings", { :alert => the_job_posting.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job_posting = JobPosting.where({ :id => the_id }).at(0)

    the_job_posting.company = params.fetch("query_company")
    the_job_posting.sector_of_occupation = params.fetch("query_sector_of_occupation")
    the_job_posting.compensation = params.fetch("query_compensation")
    the_job_posting.user_id = params.fetch("query_user_id")
    the_job_posting.job_applications_count = params.fetch("query_job_applications_count")

    if the_job_posting.valid?
      the_job_posting.save
      redirect_to("/job_postings/#{the_job_posting.id}", { :notice => "Job posting updated successfully."} )
    else
      redirect_to("/job_postings/#{the_job_posting.id}", { :alert => the_job_posting.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job_posting = JobPosting.where({ :id => the_id }).at(0)

    the_job_posting.destroy

    redirect_to("/job_postings", { :notice => "Job posting deleted successfully."} )
  end
