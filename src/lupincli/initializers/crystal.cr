module LupinCli
  class CrystalInitializer
    TEMPLATE = "require \"lupin\"

  # Create our tasks.
  Lupin.task(\"template\")

    "

    def initialize
      # TODO use Epilog
      if File.exists?(LUPINFILE_PATH)
        puts("lupinfile.cr already exists in target directory.")
        Process.exit(0)
      else
        # Create our lupinfile
        File.write(LUPINFILE_PATH, TEMPLATE)
      end
      # TODO use Epilog
      puts "Created lupinfile.cr in target directory."
    end
  end
end
