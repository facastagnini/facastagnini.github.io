# encoding: UTF-8
# frozen_string_literal: true
source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)
ruby versions['ruby']

group :test do
  gem "rake"
  gem 'jekyll'
  gem 'html-proofer'
  gem 'pry'
  gem 'rubocop'
end

group :jekyll_plugins do
  gem "jekyll-paginate"
  gem 'github-pages'
end
