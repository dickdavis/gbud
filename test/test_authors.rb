require './getinfo.rb'

authors = GetInfo.user_prompt('Project authors separated by a comma => ').split(', ')

print authors