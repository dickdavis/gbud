##
# = Guardfile
# Author::    Richard Davis
# Copyright:: Copyright 2017 Richard Davis
# License::   GNU Public License 3
#
# The Guardfile tells the guard programs which files/directories to watch.
#
# gbud is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# gbud is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with gbud.  If not, see <http://www.gnu.org/licenses/>.

directories(%w[lib test])\
  .select { |d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist") }

guard :minitest, spring: true do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.+)\.rb$})                               { |m| "test/lib/#{m[1]}_test.rb" }
end
