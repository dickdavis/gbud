# Copyright 2016 Richard Davis
#
# This file is part of gbud.
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

module GBud
  class ProjectBuilder
    attr_reader :metadata, :cli, :files, :paths

    ##
    # Instantiates the ProjectBuilder object using information provided
    #
    # metadata : a hash containing the name, summary, description, authors, email
    #            and URL for the project to be initialized
    # cli      : specifies the need for a CLI option parser and executable
    #
    def initialize metadata, cli
      @metadata = metadata
      @cli = cli
      @files = {
        readme: 'README.md',
        gemspec: "#{metadata[:name]}.gemspec",
        gemfile: 'Gemfile',
        rakefile: 'Rakefile',
        main: "#{metadata[:name]}.rb",
        hello: "hello.rb",
        test_hello: "test_hello.rb"
      }
      @paths = {
        project_dir: "#{metadata[:name]}/",
        project_lib_dir: "#{metadata[:name]}/lib/",
        project_lib_project_dir: "#{metadata[:name]}/lib/#{metadata[:name]}/",
        project_test_dir: "#{metadata[:name]}/test/"
      }
      if cli == true
        @files[:executable] = "#{metadata[:name]}"
        @paths[:project_bin_dir] = "#{metadata[:name]}/bin/"
      end
    end

    def build
      make_directories
      make_files
      make_executable :executable if @cli == true
    end

    private

    ##
    # make_directories
    # Creates the project directory structure
    def make_directories
      @paths.each do |path, dir|
        FileUtils.mkdir_p(dir)
      end
    end

    def make_files
      @files.each do |template, filename|
        directory = map_template template
        file = File.new "#{directory}#{filename}", 'w+'
        file.puts(render template)
        file.close
        make_executable if template == :executable
      end
    end

    def map_template template
      dir = case template
        when :readme
          @paths[:project_dir]
        when :gemspec
          @paths[:project_dir]
        when :gemfile
          @paths[:project_dir]
        when :rakefile
          @paths[:project_dir]
        when :main
          @paths[:project_lib_dir]
        when :hello
          @paths[:project_lib_project_dir]
        when :executable
          @paths[:project_bin_dir]
        when :test_hello
          @paths[:project_test_dir]
      end
    end

    def render template
      path = File.expand_path(File.join(File.dirname(__FILE__),
                                        '..',
                                        'templates',
                                        "#{template.to_s}.rb.erb"))
      ERB.new(File.read(path)).result(binding)
    end

    def make_executable
      File.chmod(0755, "#{@paths[:project_bin_dir]}#{@files[:executable]}")
    end
  end
end
