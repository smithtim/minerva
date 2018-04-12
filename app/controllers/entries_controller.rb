class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
	before_action :set_journal

	def create
		@entry = @journal.entries.new entry_params

    if @entry.save
			redirect_to @journal, notice: 'Entry created.'
    else
      render :new
    end
	end

  def destroy
    @entry.destroy
		redirect_to @journal, notice: 'Entry deleted.'
  end

	def edit
	end

	def new
    @entry = Entry.new
	end

	def show
	end

	def update
		if @entry.update entry_params
			redirect_to @journal, notice: 'Entry updated.'
		else
			render :edit
		end
	end

	private
    def set_entry
      @entry = Entry.find params[:id]
    end

		def set_journal
			# every entry belongs to a journal
			@journal = Journal.find params[:journal_id]
		end

    # only allow white list parameters through
		def entry_params
			params.require(:entry).permit :title, :body
		end
end
