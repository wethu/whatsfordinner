require "./init.rb"
MIGRATIONS_DIR = "db/migrate".freeze
task default: :migrate

desc "Run migrations"
task :migrate do
  ActiveRecord::Migrator.migrate("db/migrate", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

desc "Rollback migration"
task :rollback do
  step = ENV["STEP"] ? ENV["STEP"].to_i : 1
  ActiveRecord::Migrator.rollback MIGRATIONS_DIR, step
end
