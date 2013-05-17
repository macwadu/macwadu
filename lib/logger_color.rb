require 'logger'
require 'colored'

class Log < Logger

  def format_message(severity, msg)
    string = "#{Time.now.strftime('%Y-%m-%d %X')} [#{severity}][#{self.calling_method}][#{self.line_calling_method}] ::#{msg}\n"

    case severity
      when 'DEBUG'
        string
      when 'WARN'
        string.magenta.bold
      when 'INFO'
        string.green.bold
      when 'ERROR'
        string.red.bold
      when 'FATAL'
        string.black.blue.to_eol.bold
      else
        string.blue
    end

  end

  #def deprecated(progname = nil, &block)
  #  add(DEPRECATED, nil, progname, &block)
  #end

  #get name of the file where method is called
  def calling_method
    caller[3] =~ /.*\/(.*?)\:\d+/ and $1
  end

  #get line number of the file where method is called
  def line_calling_method
    caller[3] =~ /.*\/.*?\:(\d+)/ and $1
  end
end

#LOG = Log.new(STDOUT)
#LOG.datetime_format = "%Y-%m-%d %X" # simplify time output
#LOG.level = Log::DEBUG

