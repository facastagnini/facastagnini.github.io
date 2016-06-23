# encoding: UTF-8
# frozen_string_literal: true
require 'html-proofer'
require 'yaml'

namespace :assets do
  task :precompile do
    sh 'bundle exec jekyll build'
  end
end

def config
  config = YAML.load_file('_config.yml')
  config['proofer'].keys.each do |key|
    config['proofer'][key.to_sym] = config['proofer'].delete(key)
  end
  config
end

def coverage
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

def build_site
  sh 'bundle exec jekyll build --config _config.yml --drafts'
end

def doctor_site
  sh 'bundle exec jekyll doctor'
end

def html_proofer
  puts "HTML Proofer version: #{HTMLProofer::VERSION}"
  HTMLProofer.check_directory('./_site', {
		:url_ignore => [],
    :checks_to_ignore => [],
    :allow_hash_href => true,
    :check_favicon => false,
    :check_html => false,
    :disable_external => false,
    :empty_alt_ignore => false,
    :enforce_https => false
  }).run
end

task :test do
  if ENV['CI']
    # coverage
    build_site
    doctor_site
    html_proofer
  end
end

task :default => :test