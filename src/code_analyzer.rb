
class CodeAnalyzer

  def run(code)
    code.split("\n").each do |line|
      m = line.match(/class(.*)\{/)
      if m
        return m[1].strip
      end
    end
  end

end
