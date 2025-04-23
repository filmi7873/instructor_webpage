class StudentsController < ApplicationController
  def dashboard
    evaluated_event_ids = current_user.evaluations.pluck(:event_id)
    @events = Event.where.not(id: evaluated_event_ids + current_user.presented_events.pluck(:id))
    @presented_events = current_user.presented_events
    @feedbacks = Feedback.where.not(student_id: current_user.id)
  rescue ActiveRecord::RecordNotFound
    @events = []
    @presented_events = []
    @feedbacks = []
    flash[:alert] = "No events found"
  end

  def presenter_feed
    @event = Event.find(params[:event_id])
    @feedbacks = Feedback.where(event_id: @event.id).where.not(student_id: current_user.id)
    @evaluations = @event.evaluations.includes(:student).where.not(student_id: current_user.id)

    presenter_link = @event.event_presenters.find_by(user_id: current_user.id)
    @presenter_grade = presenter_link&.grade
  rescue ActiveRecord::RecordNotFound
    redirect_to students_dashboard_path, alert: "Event not found"
  end
  
  def eval_form
    @event = Event.find(params[:event_id])
    @evaluation = Evaluation.new(event: @event)
  end

  def create_evaluation
    @event = Event.find(evaluation_params[:event_id])
    @evaluation = @event.evaluations.build(evaluation_params)
    @evaluation.student = current_user
  
    # Debug logging
    Rails.logger.debug "Event: #{@event.inspect}"
    Rails.logger.debug "Evaluation: #{@evaluation.inspect}"
    
    if @evaluation.save
      Rails.logger.debug "Evaluation saved successfully"
      redirect_to students_dashboard_path, notice: "Evaluation submitted!"
    else
      Rails.logger.debug "Evaluation errors: #{@evaluation.errors.full_messages}"
      render :eval_form, status: :unprocessable_entity
    end
  rescue => e
    Rails.logger.error "Error creating evaluation: #{e.message}"
    redirect_to students_dashboard_path, alert: "Error creating evaluation"
  end
  
  
  

  private

  def evaluation_params
    params.require(:evaluation).permit(:event_id, :clarity, :organization, :technical, :comments)

  end
  
end
