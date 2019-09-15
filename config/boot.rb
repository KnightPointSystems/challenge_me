ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
# ExecJS wasn't working properly with the JScript runtime on Windows so use
# Node.js as the runtime instead. See the SO page below for details:
# https://stackoverflow.com/questions/12520456/execjsruntimeerror-on-windows-trying-to-follow-rubytutorial/
# Note that removing the "//= require_tree ." in application.js isn't a proper fix and modifying
# ExecJS's runtimes.rb didn't fix the issue on Windows 10 64-bit
ENV['EXECJS_RUNTIME'] = 'Node'

require 'bundler/setup' # Set up gems listed in the Gemfile.