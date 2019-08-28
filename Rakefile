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
		:url_ignore => [
      "https://linkedin.com/in/fcastagnini",
      "https://www.indiegogo.com/projects/buy-a-brick-for-the-nikola-tesla-museum#/",
      "https://www.resilio.com",
      "https://www.jamescoyle.net/how-to/943-create-a-ram-disk-in-linux",
      # we need to ignore the permalink
      "/Look_at_me_Dad_I_am_blogging",
      "/Monitoring_RSYSLOG_with_Zabbix",
      "/Toss_that_flash_player_away",
      "/Why_I_am_syncing_my_files_with_SyncThing",
      "/puppet-ram-mountpoint",
      "/The-Nikola-Tesla-Museum-is-happening",
      "/Picking_a_strobogrammatic_prime_domain_name",
      "/A-different-gift-for-my-friend",
      # nico's site seems to be down today
      "http://blog.reyni.co/2018/01/20/a-different-birthday-present-for-my-friend/",
      "/home-assistant-swiss-army-knife",
      "/how-to-flash-YX-WS01-smart-plug"
    ],
    :checks_to_ignore => [],
    :allow_hash_href => true,
    :check_favicon => false,
    :check_html => false,
    :disable_external => false,
    :empty_alt_ignore => false,
    :enforce_https => false,
    :typhoeus => {
      :headers => { "User-Agent" => "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" },
      :ssl_verifyhost => 0,
      :ssl_verifypeer => false,
      :followlocation => true,
      :connecttimeout => 10,
      :timeout => 30
    }}).run
end

task :test do
  # coverage
  build_site
  doctor_site
  html_proofer
end

task :default => :test
