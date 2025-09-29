source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.3"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails", "~> 3.3.1"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Capistrano is a utility and framework for executing commands in parallel on multiple remote machines, via SSH.
  gem "capistrano", "~> 3.19", require: false
  # Rails specific Capistrano tasks
  gem "capistrano-rails", "~> 1.7", require: false
  # rbenv integration for Capistrano
  gem "capistrano-rbenv", "~> 2.1", ">= 2.1.4"
  # Bundler support for Capistrano 3.x
  gem "capistrano-bundler", "~> 1.1", ">= 1.1.4"
  # Provides a better error page for Rails and other Rack apps. Includes source code inspection, a live REPL and local/instance variable inspection for all stack frames.
  # [https://github.com/BetterErrors/better_errors]
  gem "better_errors", "~> 2.10", ">= 2.10.1"
  # Retrieve the binding of a method's caller in MRI 1.9.2+ [https://github.com/banister/binding_of_caller]
  gem "binding_of_caller", "~> 1.0", ">= 1.0.1"
  # help to kill N+1 queries and unused eager loading. [https://github.com/flyerhzm/bullet]
  gem "bullet", "~> 8.0", ">= 8.0.8"
  # i18n-tasks helps you find and manage missing and unused translations. It analyses code statically for key usages,
  # such as `I18n.t('some.key')`, in order to report keys that are missing or unused, pre-fill
  # missing keys (optionally from Google Translate), and remove unused keys.
  # [https://github.com/glebm/i18n-tasks]
  gem "i18n-tasks", "~> 1.0", ">= 1.0.15"

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

# Process manager for applications with multiple components
gem "foreman", "~> 0.88.1"

# Flexible authentication solution for Rails with Warden
gem "devise", "~> 4.9", ">= 4.9.3"

# Object oriented authorization for Rails applications
gem "pundit", "~> 2.5"
