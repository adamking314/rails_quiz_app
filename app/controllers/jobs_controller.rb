class JobsController < ApplicationController
    before_action :set_job, only: [:show]
  
    # POST /jobs
    def create
      job = Job.new(job_params)
      if job.save
        render json: job, status: :created
      else
        render json: job.errors, status: :unprocessable_entity
      end
    end
  
    # GET /jobs/:id
    def show
      render json: @job
    end
  
    # GET /jobs
    def index
      jobs = Job.all
      render json: jobs
    end
  
    private
  
    # Strong parameters
    def job_params
      params.require(:job).permit(:url, :employer_name, :employer_description, :job_title, :job_description, :year_of_experience, :education_requirement, :industry, :base_salary, :employment_type_id)
    end
  
    # Set job for show action
    def set_job
      @job = Job.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Job not found' }, status: :not_found
    end
  end
  