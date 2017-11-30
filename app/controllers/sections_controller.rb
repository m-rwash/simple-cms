class SectionsController < ApplicationController
  
  before_action :find_page

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
      redirect_to(sections_path(:page_id => @page.id))
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
      redirect_to(section_path(@section ,:page_id => @page.id))
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
    redirect_to(sections_path(:page_id => @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
