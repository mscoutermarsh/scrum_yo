# Allows us to print rainbow text to console
class Rainbow
  PI_3 = Math::PI / 3

  def initialize
    # colors calculation stolen from Minitest's Pride Plugin
    # https://github.com/seattlerb/minitest
    @colors = (0...(6 * 7)).map do |n|
      n *= 1.0 / 6
      r  = (3 * Math.sin(n) + 3).to_i
      g  = (3 * Math.sin(n + 2 * PI_3) + 3).to_i
      b  = (3 * Math.sin(n + 4 * PI_3) + 3).to_i

      36 * r + 6 * g + b + 16
    end
    @color_index = 0
  end

  def rainbow
    @color_index == (@colors.size - 1) ? @color_index = 0 : @color_index += 1
    @colors[@color_index]
  end

  def colorize(string)
    rainbow_string = ''
    string.each_char do |char|
      rainbow_string << "\e[38;5;#{rainbow}m#{char}\e[0m"
    end

    rainbow_string
  end

end
