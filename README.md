#Gem Buddy
##About
This project aims to simplify the initialization of a Ruby project by setting up the appropriate directories and files needed.

##What it Does
This script takes the project name as user input and sets up the directory structure and additional files that would otherwise be required for the user to create manually.

##Installation
To install from rubygems, execute:

`gem install gbud`

Alternatively, you could build from source:

```
git clone https://github.com/d3d1rty/gbud.git
cd gbud
gem build gbud.gemspec
gem install ./gbud-0.0.1.gem
```

##Usage
1. Navigate to the directory you want to hold the project
2. Execute command `gbud`
3. Answer the prompts to set the required information for the project
4. Based off your input, gbud will generate
  * a skeleton directory for the project
  * an executable
  * base script
  * test script
  * gemspec
  * Rakefile
5. Navigate to the generated project directory
6. Execute `rake test` to verify everything is good to go
7. Happy coding!

##TODO
* Write RDoc's
* Write code to validate input for URI to prevent gem build issues
* Implement Getoptlong to take arguments
* Modify code for options
  * be able to specify path to project directory as an argument
  * be able to choose between loading variables from a file or interactively (as it is now)
  * be able to display a list of commands

##Dependencies
Ruby 2.0 or higher

##Credits
Thanks to the Ruby community for the valuable learning resources.

##Questions/Comments/Concerns
If you have any questions regarding this project, send me a message and I'd be more than happy to explain my code.

