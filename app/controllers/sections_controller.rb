class SectionsController < ApplicationController
  
  layout 'admin'
  before_action :find_page, :find_subject

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
  end

  def create
    @section = Section.new(section_params)
    #@section.page_id = 2
    if @section.save
      flash[:notice] = "You Created a new Section Successfully!"
      redirect_to(subject_page_sections_path(@subject, @page))
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "You Updated The Section Successfully!"
      redirect_to(subject_page_section_path(@subject, @page, @section))
    else
      render('edit')
    end
  end
 
  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "You Deleted The Section Successfully!"
    redirect_to(subject_page_sections_path(@subject, @page))
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end
end
