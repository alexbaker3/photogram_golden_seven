class PhotosController < ApplicationController

def index
  @list_of_all_my_photos= Photo.all

  render ("photos/index.html.erb")
end

def new_form

  render ("photos/new_form.html.erb")
end

def create_row
  url= params[:image_url]
  cap= params[:caption]
  new_photo=Photo.new
  new_photo.source = url
  new_photo.caption = cap
  new_photo.save
  #render ("photos/create_row.html.erb")
  redirect_to("/photos")
end

def show
the_id = params[:da_id]
@my_photo = Photo.find(the_id)

  render ("photos/show.html.erb")
end

def edit_form
  the_id = params[:la_id]
  @my_photo = Photo.find(the_id)
  render ("photos/edit_form.html.erb")
end

def update_row
  the_id = params[:le_id]
  @my_photo = Photo.find(the_id)
  url= params[:da_source]
  cap= params[:da_caption]
  @my_photo.source = url
  @my_photo.caption = cap
  @my_photo.save
  redirect_to("/photos/#{@my_photo.id}")
end

def destroy_row
the_id = params[:id]
d = Photo.find(the_id)
d.destroy
  redirect_to("/photos")
end


end
