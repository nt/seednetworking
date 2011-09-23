class ProjectsController < ApplicationController

  before_filter :load_event
  before_filter :authenticate_user!, except: [:show]

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
    authorize! :read, @project
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
    authorize! :signup_project, @event
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    authorize! :update, @project
  end

  # POST /projects
  # POST /projects.xml
  def create
    authorize! :signup_project, @event
    @project = Project.new(params[:project])
    @project.event = @event
    @project.user = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to([@event, @project], :notice => 'Votre projet a bien ete enregistre') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])
    authorize! :update, @project

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to([@event,@project], :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def interested
    @project = Project.find(params[:project_id])
    authorize! :vote, @project
    
    @project.liked_by current_user
    
    respond_to do |format|  
       format.html { redirect_to([@event, @project], notice: 'Merci pour votre vote !') }  
       format.js   { render :nothing => true }  
    end
  end

end
