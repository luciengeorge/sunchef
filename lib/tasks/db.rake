# frozen_string_literal: true

namespace :db do
  desc "Dumping production database..."
  task import: [:environment, :dump]

  task dump: [:environment] do
    CLI::UI::Frame.open("Importing DB") do
      status = system(%x(git status --porcelain))
      CLI::UI::SpinGroup.new do |_spin_group|
        if status.nil?
          spin_group.add("Checking out to main...") do |spinner|
            system "git checkout main"
            spinner.update_title("On main branch")
          end
          spin_group.add("Pulling last version of the code...") do |spinner|
            system "git pull origin main"
            spinner.update_title("Pulled last version")
          end
          spin_group.add("Dropping database...") do |spinner|
            system "rails db:drop"
            spinner.update_title("Database dropped")
          end
          spin_group.add("Dumping db...") do |spinner|
            system "heroku pg:pull DATABASE_URL sunchef_development --app damp-hollows-31736"
            spinner.update_title("Database dumped")
          end
          spin_group.add("Migrating...") do |spinner|
            system "rails db:migrate"
            spinner.update_title("Database migrated")
          end
          puts CLI::UI.fmt("{{v}} {{green:Database imported successfully.}}")
        else
          puts CLI::UI.fmt("{{x}} {{red:Branch not clean.}}")
        end
      end
    end
  end
end
