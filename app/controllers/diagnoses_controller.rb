# -*- coding: utf-8 -*-
class DiagnosesController < ApplicationController
  before_filter :authenticate_user!

  # GET /diagnoses
  # GET /diagnoses.xml
  def index
    @diagnoses = Diagnosis.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diagnoses }
    end
  end

  # GET /diagnoses/1
  # GET /diagnoses/1.xml
  def show
    @diagnosis = Diagnosis.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diagnosis }
    end
  end

  # GET /diagnoses/new
  # GET /diagnoses/new.xml
  def new
    @diagnosis = Diagnosis.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diagnosis }
    end
  end

  # GET /diagnoses/1/edit
  def edit
    @diagnosis = Diagnosis.get(params[:id])
  end

  # POST /diagnoses
  # POST /diagnoses.xml
  def create
    @diagnosis = Diagnosis.new(params[:diagnosis])

    respond_to do |format|
      if @diagnosis.save
        format.html { redirect_to(@diagnosis, :notice => 'Diagnosis was successfully created.') }
        format.xml  { render :xml => @diagnosis, :status => :created, :location => @diagnosis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diagnosis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diagnoses/1
  # PUT /diagnoses/1.xml
  def update
    @diagnosis = Diagnosis.get(params[:id])

    respond_to do |format|
      if @diagnosis.update(params[:diagnosis])
        format.html { redirect_to(@diagnosis, :notice => 'Diagnosis was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @diagnosis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnoses/1
  # DELETE /diagnoses/1.xml
  def destroy
    @diagnosis = Diagnosis.get(params[:id])
    @diagnosis.destroy

    respond_to do |format|
      format.html { redirect_to(diagnoses_url) }
      format.xml  { head :ok }
    end
  end

  def relation
    @diagnosis = Diagnosis.get(params[:id])

    respond_to do |format|
      format.html { render }
      format.xml  { render :xml => @diagnosis }
    end    
  end

  def search_interview
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @diagnosis }
    end    
  end

  def search_interview_start
    @interviews = Interview.all(:note.like => "%#{params[:note]}%")
    render :partial => "search_interview_result"
  end

  def add_relation
    @diagnosis = Diagnosis.get(params[:diagnosis_id])
    interview = Interview.get(params[:interview_id])
    @diagnosis.interviews.push(interview)
    @diagnosis.save

    render :partial => "interviews_list"
  end

  def delete_relation
    join = DiagnosisInterview.first(:interview_id => params[:interview_id],
                                    :diagnosis_id => params[:diagnosis_id])

    join.destroy unless join.nil?

    @diagnosis = Diagnosis.get(params[:diagnosis_id])
    render :partial => "interviews_list"
  end

end
