require "yaml"

module Namegen
  END_CHAR = '\0'
  UNREACHABLE = "Unreachable code"

  module Language
    DE = "de"
  end

  module Gender
    FEMALE = "f"
    MALE = "m"
  end

  def self.generator(language, gender, order=3)
    Generator.new(language, gender, order)
  end

  class Generator
    def initialize(@language, @gender, @order)
      raw_data = File.read("#{__DIR__}/data/#{language}/#{gender}.yml")
      names = YAML.load(raw_data) as Array(YAML::Type)
      @chains = {} of String => Chain

      names.each do |untyped_name|
        name = untyped_name as String

        (0..name.size).each do |size|
          next_char = size < name.size ? name[size] : END_CHAR

          state = cut_string_by_order(name[0...size])
          @chains[state] ||= Chain.new
          @chains[state] << next_char
        end
      end
    end

    def name
      state = ""
      result = ""
      loop do
        char = @chains[state].pick
        return result if char == END_CHAR
        result += char
        state = cut_string_by_order(result)
      end

      raise UNREACHABLE
    end

    private def cut_string_by_order(value)
      return value if value.size < @order
      value[-@order..-1]
    end
  end

  class Chain
    def initialize
      @chars = {} of Char => Int32
      @count = 0
    end

    def <<(char : Char)
      @chars[char] ||= 0
      @chars[char] += 1
      @count += 1
    end

    def pick
      number = rand(@count)
      sum = 0
      @chars.each do |char, value|
        sum += value
        return char if sum > number
      end

      raise UNREACHABLE
    end
  end
end
