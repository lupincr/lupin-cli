require "epilog"

module LupinCli
  class CrystalInitializer
    TEMPLATE = "require \"lupin\"

# Create your tasks here!

Lupin.task(\"first-step\")
  .command(\"touch lupin-works.txt\")
    "

    def initialize
      @logger = Epilog::Logger.new
      if File.exists?(LUPINFILE_PATH)
        @logger.fatal("lupinfile.cr already exists in target directory.")
        Process.exit(0)
      else
        File.write(LUPINFILE_PATH, TEMPLATE)
      end
      @logger.success("Created lupinfile.cr in target directory.")
      @logger.ready("Have fun using Lupin!")
    end
  end
end
