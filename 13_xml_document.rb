class XmlDocument

  def initialize(indent = false)
    @indent = indent
    @indents = 0
  end

  def method_missing(*args, &prc)

    unless block_given?
      return "<#{args[0]}/>" if args.size == 1

      tag = args[1].map {|key, value| "#{key}='#{value}'" }.join(' ')

      return "<#{args[0]} #{tag}/>"
    else
      if @indent
        @indents += 1

        to_insert = prc.call

        string = "<#{args[0]}>\n#{"  "*(@indents)}#{to_insert}\n#{"  "*(@indents-1)}</#{args[0]}>"

        @indents -= 1
        string << "\n" if @indents.zero?
        return string
      end

      return "<#{args[0]}>#{prc.call}</#{args[0]}>"
    end
  end

end


#
