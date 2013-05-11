# Use the app.rb file to load Ruby code, modify or extend the models, or
# do whatever else you fancy when the theme is loaded.

module Nesta
  class App
    # Uncomment the Rack::Static line below if your theme has assets
    # (i.e images or JavaScript).
    #
    # Put your assets in themes/[themename]/public/[themename]/
    #
    use Rack::Static, :urls => ["/html5boilerplate"], :root => "themes/html5boilerplate/public"

    configure do
      # Configuring sass
      sass_options = Hash.new

      #     Making the generated css easier to read an debug
      sass_options[:line_numbers] = true        # Other interesting options:
                                                # :debug_info => true   # if using FireBug
                                                # :style => :nested     # Can sometimes make the generated css easier to read
                                                # Options documentation:
                                                # http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#options
      set :sass, sass_options
      set :scss, sass_options
    end

    configure :development do
      # Setup logging
      #
      # To write something to the log:
      # $stdout.puts 'something'
      log = true  # Disable logging by setting this to false
      if log
        theme_path = Pathname.new(File.dirname(__FILE__))
        theme_name = theme_path.realpath.basename.to_s
        root = theme_path.parent.parent

        logs_path = root + 'logs' # Placed in site directory (the root)
        FileUtils.mkdir_p(logs_path)  # Creates the logs directory if it does not exist
        theme_log_path = logs_path.realpath + "#{theme_name + '.log'}"

        $stdout.reopen(theme_log_path)
        $stderr.reopen(theme_log_path)

        enable :logging
      end
    end

    helpers do
      # Add new helpers here.
    end

    # Add new routes here.
  end
end
