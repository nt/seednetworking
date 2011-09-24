class ParticipationsController < ApplicationController
  
  before_filter :load_event
  before_filter :authenticate_user!

  # GET /participations/new
  # GET /participations/new.xml
  def new
    authorize! :signup_self, @event
    @participation = Participation.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participation }
    end
  end

  # GET /participations/1/edit
  def edit
    @participation = Participation.find(params[:id])
    authorize! :update, @participation
  end

  # POST /participations
  # POST /participations.xml
  def create
    authorize! :signup_self, @event
    @participation = Participation.new(params[:participation])
    @participation.seeking ||= params[:seeking_other]
    @participation.event = @event
    @participation.user = current_user
    respond_to do |format|
      if @participation.save
        format.html { redirect_to(@event, :notice => 'Votre participation a bien ete enregistree, n\'oubliez pas de voter pour vos projets favoris') }
        format.xml  { render :xml => @participation, :status => :created, :location => @participation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participations/1
  # PUT /participations/1.xml
  def update
    @participation = Participation.find(params[:id])
    authorize! :update, @participation
    respond_to do |format|
      if @participation.update_attributes(params[:participation])
        format.html { redirect_to(@participation, :notice => 'Participation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participation.errors, :status => :unprocessable_entity }
      end
    end
  end

end
