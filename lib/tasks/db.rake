# frozen_string_literal: true

namespace :db do
  desc "Dumping production database..."
  task import: [:environment, :dump]

  task dump: [:environment] do
    CLI::UI::Frame.open("Importing DB") do
      status = system(%x(git status --porcelain))
      if status.nil?
        puts "Checking out to main..."
        system "git checkout main"
        puts "Pulling last version of the code..."
        system "git pull origin main"
        puts "Dropping database..."
        system "rails db:drop"
        puts "Dumping db..."
        system "heroku pg:pull DATABASE_URL sunchef_development --app damp-hollows-31736"
        system "bundle install"
        puts "Migrating..."
        system "rails db:migrate"
        puts CLI::UI.fmt("{{v}} {{green:Database imported successfully.}}")
      else
        puts CLI::UI.fmt("{{x}} {{red:Branch not clean.}}")
      end
    end
  end
end
