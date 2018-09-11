require "bargs"
require "./lupincli/*"
require "./lupincli/initializers/*"

module LupinCli
  VERSION        = "0.1.0"
  LUPINFILE_PATH = "./lupinfile.cr"

  def self.init(args)
    mode = "cr"
    if args.size > 0
      mode = args[0]
    end

    case mode
    when "cr"
      CrystalInitializer.new
    end
  end

  def self.run(args)
    if args.size == 0
      # Run task "default"
      puts "Running default task"
    else
      puts "Running tasks: #{args.to_s}"
    end
  end

  interface = Bargs::CLI.new
  interface.help = "Lupin CLI 1.0"

  interface.flag "version" do |flag|
    flag.short = "s"
  end

  args = interface.process

  case args.command_name
  when "init"
    self.init(args.rest)
  when "run"
    self.run(args.rest)
  when "-v", "--version"
    puts "Lupin CLI v#{VERSION}"
  end
end
