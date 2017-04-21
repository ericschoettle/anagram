require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/anagram')
require('pry')

get('/') do
  erb(:index)
end

get('/result') do
  @result = params.fetch('word1').anagram_handler(params.fetch('word2'))
  erb(:result)
end
