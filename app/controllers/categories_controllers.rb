class CategoriesController < ApplicationController

  get '/categories' do
    @categories = Category.all
    erb :'categories/index'
  end

  get '/categories/new' do
    erb :'categories/new'
  end

  post '/categories' do
    @category = Category.create(params['category'])
    redirect to "/categories/#{@category.id}"
  end

  get '/categories/:id' do
    @category = Category.find(params[:id])
    erb :"categories/show"
  end

  get '/categories/:id/edit' do
    @category = Category.find(params[:id])
    erb :"categories/edit"
  end

  post '/categories/:id' do
    @category = Category.find_by_id(params[:id])
    @category.update(params)
    @category.save
    redirect to "/categories/#{@category.id}"
  end

  delete '/categories/:id/delete' do
    @category = Category.find_by_id(params[:id])
    @category.destroy
    redirect "/programs"
  end

end
