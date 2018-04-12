class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  # GET /journals
  def index
    @journals = Journal.all
  end

  # GET /journals/1
  def show
		# if a search query was given, use it to filter the entries
		if params['search']
			query = params['search'].downcase
			@search_results = @journal.entries.select {|entry|
				entry.title.downcase.include? query
			}
		end
  end

  # GET /journals/new
  def new
    @journal = Journal.new
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  def create
    @journal = Journal.new journal_params

    if @journal.save
			redirect_to @journal
    else
      render :new
    end
  end

  # PATCH/PUT /journals/1
  def update
    if @journal.update journal_params
      redirect_to @journal, notice: 'Journal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /journals/1
  def destroy
    @journal.destroy
    redirect_to journals_url, notice: 'Journal deleted.'
  end

  private
    def set_journal
      @journal = Journal.find params[:id]
    end

    # only allow white list parameters through
    def journal_params
      params.require(:journal).permit(:name)
    end
end
