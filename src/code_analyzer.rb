
class CodeAnalyzer

  def run(code)
    result = {}
    code.split("\n").each do |line|
      m = line.match(/class(.*)\{/)
      if m
        result[:class_name] = m[1].strip
      end
    end
    result[:lines] = code.count("\n") - 2
    result
  end

end
