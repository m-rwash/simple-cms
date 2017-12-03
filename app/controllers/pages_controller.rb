class PagesController < ApplicationController
  layout 'admin'

  before_action :find_subject

  def index
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
    @pages_count = Page.count + 1
    @subjects = Subject.sorted
  end

  def create
    @page = Page.new(page_params)
    #@page.subject_id = 1
    if @page.save
      flash[:notice] = "Page Created Successfully!"
      redirect_to(subject_pages_path(@subject))
    else 
      @pages_count = Page.count + 1
      @subjects = Subject.sorted
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @pages_count = Page.count
    @subjects = Subject.sorted
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page Updated Successfully!"
      redirect_to(subject_page_path(@page, @subject))
    else 
      @pages_count = Page.count
      @subjects = Subject.sorted
      render('edit')
    end
  end


  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page Deleted Successfully!"
    redirect_to(subject_pages_path(@subject))
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible, :subject_id)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

end
