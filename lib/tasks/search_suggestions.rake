namespace :search_suggestions do
  desc "Generate search terms from apis"
  task :index => :environment do
    SearchSuggestion.index_apis
  end
end