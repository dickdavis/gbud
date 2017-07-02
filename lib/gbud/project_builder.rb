module GBud
  ##
  # = ProjectBuilder
  # Author::    Richard Davis
  # Copyright:: Copyright 2017 Richard Davis
  # License::   GNU Public License 3
  #
  # The engine that is instantiated to build out the project directory
  # skeleton and basic files using templates.
  class ProjectBuilder
    # Project metadata information supplied by user
    attr_reader :metadata
    # Option for making project executable
    attr_reader :cli
    # Hash containing file names for project files
    attr_reader :files
    # Hash specifying project directories
    attr_reader :paths

    ##
    # Instantiates a ProjectBuilder object
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

    ##
    # Builds the project
    def build
      make_directories
      make_files
      make_executable :executable if @cli == true
    end

    private

    ##
    # Creates the project directories
    def make_directories
      @paths.each do |path, dir|
        FileUtils.mkdir_p(dir)
      end
    end

    ##
    # Makes the files using templates
    def make_files
      @files.each do |template, filename|
        directory = map_template template
        file = File.new "#{directory}#{filename}", 'w+'
        file.puts(render template)
        file.close
        make_executable if template == :executable
      end
    end

    ##
    # Maps each templated file to correct directory
    def map_template template
      case template
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

    ##
    # Renders the templates into files
    def render template
      path = File.expand_path(File.join(File.dirname(__FILE__),
                                        '..',
                                        'templates',
                                        "#{template}.rb.erb"))
      ERB.new(File.read(path)).result(binding)
    end

    ##
    # Flags the CLI file as executable
    def make_executable
      File.chmod(0755, "#{@paths[:project_bin_dir]}#{@files[:executable]}")
    end
  end
end
