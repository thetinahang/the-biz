# frozen_string_literal: true

class TermsController < ApplicationController
  before_action :set_term, only: %i[show edit update destroy]

  # GET /terms
  # GET /terms.json
  def index
    @query = Query.find_by(user_id: params[:user_id], id: params[:query_id])
    if @query
      @terms = @query.terms
    else
      redirect_to user_queries_path, flash: { notice: 'Unauthorized' }
    end
  end

  # GET /terms/1
  # GET /terms/1.json
  #
  # Returns json response for this route
  # The LastFM api is called here with the parameters
  # from the terms of the query.
  def show
    if @term
      api = Api::LastFm.get_api(@term.method, @term.artist, @term.track)
      @result = api.fetch_response
    else
      redirect_to user_queries_path, flash: { notice: 'Unauthorized' }
    end
  end

  # GET /terms/new
  def new
    @term = Term.new
  end

  # GET /terms/1/edit
  def edit; end

  # POST /terms
  # POST /terms.json
  def create
    @term = Term.new(term_params)

    respond_to do |format|
      if @term.save
        format.html { redirect_to @term, notice: 'Term was successfully created.' }
        format.json { render :show, status: :created, location: @term }
      else
        format.html { render :new }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terms/1
  # PATCH/PUT /terms/1.json
  def update
    respond_to do |format|
      if @term.update(term_params)
        format.html { redirect_to @term, notice: 'Term was successfully updated.' }
        format.json { render :show, status: :ok, location: @term }
      else
        format.html { render :edit }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    @term.destroy
    respond_to do |format|
      format.html { redirect_to terms_url, notice: 'Term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_term
    @term = Term.find_by(query_id: params[:query_id], id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def term_params
    params.require(:term).permit(:name, :query_id)
  end
end
