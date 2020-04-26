# frozen_string_literal: true

class QueriesController < ApplicationController
  before_action :set_query, only: %i[show edit update destroy]

  # GET /queries
  # GET /queries.json
  def index
    @queries = @user.queries.all
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
    if @query
      render :show
    else
      render :index
    end
  end

  # GET /queries/new
  def new
    @query = @user.queries.build
    3.times do
      @term = @query.terms.build
    end
    @all_terms = []
  end

  # GET /queries/1/edit
  def edit; end

  # POST /queries
  # POST /queries.json
  def create
    @query = Query.new(query_params)

    respond_to do |format|
      if @query.save
        format.html { redirect_to user_query_path(@user, @query), notice: 'Query was successfully created.' }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queries/1
  # PATCH/PUT /queries/1.json
  def update
    respond_to do |format|
      if @query.update(query_params)
        format.html { redirect_to user_query_path(@user, @query), notice: 'Query was successfully updated.' }
        format.json { render :show, status: :ok, location: @query }
      else
        format.html { render :edit }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query.destroy
    respond_to do |format|
      format.html { redirect_to user_queries_path(@user), notice: 'Query was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_query
    @query = Query.find_by(id: params[:id], user_id: params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def query_params
    params.require(:query).permit(
      :user_id,
      :name,
      terms_attributes: %i[
        id
        method
        artist
        track
      ]
    )
  end
end
