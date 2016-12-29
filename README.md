#gbud
[![Gem Version](https://badge.fury.io/rb/gbud.svg)](https://badge.fury.io/rb/gbud)

##About
This project aims to simplify the initialization of a Ruby project by setting up the appropriate directories and files needed. By default, projects created by `gbud` are GPL-3.0 compliant, although support for the LGPL-3.0 is on the way; `gbud` will never support instantiating non-free projects.

##Why Not bundler?
`gbud` does not aim to solve the same problem that `bundler` solves, and there is no reason why you can't instantiate a project with `gbud` and use `bundler` for dependency management. However, `bundler` did not meet my requirements for creating a project from scratch (i.e. the way *I want it done*), thus I produced this gem to meet my own need. I hope it also proves useful to you, and anyone is welcome to recommending or implementing reasonable changes and enhancements to `gbud`.

##Why Use gbud?
`gbud` rapidly scaffolds a new gem for you, allowing you to skip the tedious part of building out a gem manually. It automatically protects the freedom of your code by including the GPL with your project, providing command-line options for users to get copyright and warranty information for your project, as well as inserting boilerplate GPL copyright notices on each of the source files for the project. Future efforts will allow selection of the LGPL as an alternative to the GPL.

##Installation
To install from RubyGems, execute:

`gem install gbud`

Alternatively, you could build from source:

```
git clone https://github.com/d3d1rty/gbud.git
cd gbud
gem build gbud.gemspec
gem install ./gbud-0.0.4.gem
```

##Usage
1. Navigate to the directory you want to hold the project
2. Execute command `gbud -n NAME` where `NAME` is the name for your project
3. Answer the prompts to set the required information for the project
4. Based off your input, gbud will generate
  * a skeleton directory for the project
  * an executable (if CLI is specified)
  * main script
  * library file
  * test script
  * gemspec
  * Gemfile
  * Rakefile
  * README
  * LICENSE
5. Navigate to the generated project directory
6. Get the dependencies with `bundle install`
7. Execute `rake test` to verify everything is good to go
8. Happy coding!

##TODO
* Write RDoc's
* Decouple template and project builder logic
* Write tests for `FileTemplate` (to be implemented) and `ProjectBuilder` classes
* Implement `--cli` and `--no-cli` options
* Implement `--lgpl` option for generating LGPL protected code

##Contributing
I am open to pull requests from anyone, regardless of any externalities to the project. Everyone is welcome!

##Credits
Thanks to the Ruby community for the valuable learning resources as well as the Free Software Foundation for its tireless advocacy of free and open source software.

##Questions/Comments/Concerns
If you have any questions regarding this project, send me a message and I'd be more than happy to explain my code.
