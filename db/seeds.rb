if Rails.env.development?
  begin
    puts "Adding seed data..."

    subjects = 2.times.map { |n| Fabricate(:subject)}
    pages 	 = 5.times.map { |n| Fabricate(:page, subject: subjects.sample)}
    sections = 30.times.map { |n| Fabricate(:section, page: pages.sample) }

    puts "..done!"
  rescue => e
    puts e.inspect
    puts "Something went wrong. Try running `bundle exec rake db:drop db:create db:migrate` first"
  end
end