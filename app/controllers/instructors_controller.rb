class InstructorsController < ApplicationController
  require 'ostruct'

  def dashboard
    @events = Event.all
  end

  def all_eval
    @event = Event.find(params[:event_id])
    @evaluations = Evaluation.where(event_id: @event.id).includes(:student)
    @presenters = @event.event_presenters.includes(:user)
  end

  def new_evaluation
    @evaluation = Evaluation.new
    @events = Event.all
    @students = User.where(admin: false)
  end

  def create_evaluation
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to all_eval_path(event_id: @evaluation.event_id), notice: 'Evaluation was successfully created.'
    else
      @events = Event.all
      @students = User.where(admin: false)
      render :new_evaluation, status: :unprocessable_entity
    end
  end

  def create_event
    @event = Event.new 
  end

  def update_grade
    ep = EventPresenter.find(params[:id])
    if ep.update(grade: params[:grade])
      redirect_to all_eval_path(event_id: ep.event_id), notice: 'Grade updated successfully.'
    else
      redirect_to all_eval_path(event_id: ep.event_id), alert: 'Failed to update grade.'
    end
  end
  
  def events
    if request.post?
      @event = Event.new(params.require(:event).permit(:title, :date, :description, presenter_ids: []))
      if @event.save
        redirect_to instructors_dashboard_path, notice: "Event created!"
      else
        render :create_event
      end
    else
      @events = Event.all
    end
  end

def destroy_event
  @event = Event.find(params[:id])

  @event.presenters.clear
  @event.destroy
  redirect_to instructors_dashboard_path, notice: "Event deleted successfully."
end

def roster
  @students = User.where(admin: false)
end

def save_grades
  params[:grades]&.each do |_, grade_data|
    student_id = grade_data[:student_id]
    grade = grade_data[:grade]
  
    student = User.find_by(id: student_id)
    next unless student
  
    student.update(grade: grade)
  end
  
  redirect_to roster_path, notice: "Grades saved successfully."
end
  
private

def evaluation_params
    params.require(:evaluation).permit(:event_id, :student_id, :clarity, :organization, :technical, :comments)
end

end