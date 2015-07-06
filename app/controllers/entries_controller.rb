class EntriesController < ApplicationController
  def index
    @entries = Entry.order(created_at: :desc)
  end

  def new

  end

  def update
    @entry = Entry.find_by(id: params[:id])
    if @entry.update(entry_params)
      redirect_to "/entries"
    else
      @errors = "ya blew it"
      render "/entries/edit"
    end
  end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    @entry.destroy
    redirect_to "/entries"
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
  end

  def show
    @entry = Entry.find_by(id: params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to '/entries'
    else
      @errors = "ya blew it"
      render 'entries/new'
    end
  end


  def entry_params
    params.require(:entry).permit(:title, :content)
  end
end
