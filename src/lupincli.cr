require "bargs"
require "colorize"
require "./lupincli/*"
require "./lupincli/initializers/*"

module LupinCli
  VERSION        = "0.1.0"
  LUPINFILE_PATH = "./lupinfile.cr"

  def self.init(args)
    CrystalInitializer.new
  end

  def self.run(args)
    if args.size == 0
      puts "Running default task"
    elsif args.size == 1
      puts "running task #{args[0]}"
    else
      puts "Running tasks: #{args.to_s}"
    end
  end

  lupinfile_ref = "lupinfile.cr".colorize(:yellow)
  help_message = "#{"Lupin CLI #{VERSION}".colorize(:yellow).mode(:underline).mode(:bold).to_s}

#{"Available commands:".colorize(:blue).mode(:bold).to_s}
  • init - Initializes an empty #{lupinfile_ref} inside the current directory.
  • run - Runs the default task in the current directory.
  • run #{"<task>".colorize(:blue).to_s} - Runs the given task in the current directory.
  • version - Outputs the version of #{"Lupin CLI".colorize(:yellow).to_s}.
  • help - Shows this help message.

  #{"Thank you for using Lupin!".colorize(:yellow).mode(:bold).to_s}
  "
  interface = Bargs::CLI.new
  interface.help = help_message

  args = interface.process

  case args.command_name
  when "init"
    self.init(args.rest)
  when "run"
    self.run(args.rest)
  when "version"
    puts "Lupin CLI #{VERSION}"
  when "help"
    puts help_message
  end
end
