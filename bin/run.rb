#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
about = get_about_from_user
name = get_title_from_user(about)
info = get_info_from_user(name)
show_about_info(about, name, info)
