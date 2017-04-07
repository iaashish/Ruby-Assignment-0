require 'sinatra'
require 'Course'
require 'datastore'

store = CourseStore.new('yaml/store.yml')
get '/courses' do
  @arch = store.all
erb :hello
end

get '/courses/new' do
  erb :new
end

post '/create' do
  @arch = Course.new
  @arch.state = params['state']
  @arch.capital = params['capital']
  @arch.places = params['places']
  store.save(@arch) 
  redirect '/courses'
end

get('/courses/:id') do
    id = params['id'].to_i
  @course = store.get(id)
erb :show
end