# -*- coding: utf-8 -*-
class InterviewsController < ApplicationController
  # GET /interviews
  # GET /interviews.xml
  def index
    @interviews = Interview.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.xml
  def show
    @interview = Interview.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interview }
    end
  end

  # GET /interviews/new
  # GET /interviews/new.xml
  def new
    @interview = Interview.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interview }
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.get(params[:id])
  end

  # POST /interviews
  # POST /interviews.xml
  def create
    @interview = Interview.new(params[:interview])

    respond_to do |format|
      if @interview.save
        format.html { redirect_to(@interview, :notice => 'Interview was successfully created.') }
        format.xml  { render :xml => @interview, :status => :created, :location => @interview }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interviews/1
  # PUT /interviews/1.xml
  def update
    @interview = Interview.get(params[:id])

    respond_to do |format|
      if @interview.update(params[:interview])
        format.html { redirect_to(@interview, :notice => 'Interview was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.xml
  def destroy
    @interview = Interview.get(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to(interviews_url) }
      format.xml  { head :ok }
    end
  end

  def relation
    @interview = Interview.get(params[:id])

    respond_to do |format|
      format.html { render }
      format.xml  { render :xml => @interview }
    end    
  end

  def search_diagnosis
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @interview }
    end    
  end
=begin
  def search_diagnosis_start
p ["search_diagnosis_start", params]
    @diagnoses = Diagnosis.all(:name.like => "%#{params[:name]}%")
    render :partial => "search_diagnosis_result"
  end
=end

  def ajax_search_diagnosis_start
    @diagnoses = Diagnosis.all(:name.like => "%#{params[:name]}%")

    render "ajax_search_diagnosis_start.js.erb"
  end


  def add_relation
    @interview = Interview.get(params[:interview_id])
    diagnosis = Diagnosis.get(params[:diagnosis_id])
    @interview.diagnoses.push(diagnosis)
    @interview.save

    render :partial => "diagnoses_list"
  end

  def delete_relation
    join = DiagnosisInterview.first(:interview_id => params[:interview_id],
                                    :diagnosis_id => params[:diagnosis_id])

    join.destroy unless join.nil?

    @interview = Interview.get(params[:interview_id])
    render :partial => "diagnoses_list"
  end
end
