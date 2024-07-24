class Attempt
  COLORS = {
    Red: '  Red  '.colorize(:red),
    Green: ' Green '.colorize(:green),
    Blue: ' Blue  '.colorize(:blue),
    Yellow: 'Yellow '.colorize(:yellow),
    Gray: ' Gray  '.colorize(:gray),
    Cyan: ' Cyan  '.colorize(:cyan),
    Magenta: 'Magenta'.colorize(:magenta),
    Orange: 'Orange '.colorize(:light_red)
  }.freeze

  attr_accessor :attempt_no, :one, :two, :three, :four, :hint_s

  def initialize(attempt_no)
    @attempt_no = attempt_no
    @hint_s = ''
    @one = nil
    @two = nil
    @three = nil
    @four = nil
  end

  def give_hint_s(secret_code_a)
    guesses_a = [one, two, three, four]
    return nil if guesses_a.any?(&:nil?)

    guesses_a.each_with_index do |guess, index|
      next unless guess == secret_code_a[index] # rubocop:disable Layout/EmptyLineAfterGuardClause
      self.hint_s = "#{hint_s}O"
      secret_code_a[index] = nil
      guesses_a[index] = nil
    end

    guesses_a.each do |guess|
      next if guess.nil? # rubocop:disable Layout/EmptyLineAfterGuardClause
      i = secret_code_a.index(guess)
      self.hint_s = i.nil? ? "#{hint_s}X" : "#{hint_s}C"
      secret_code_a[i] = nil unless i.nil?
      # guesses_a[index] = nil
    end

    hint_s
  end

  def valid_color?(color)
    COLORS.include? color.capitalize.to_sym
  end

  def to_s
    "(#{COLORS[one]})   (#{COLORS[two]})   (#{COLORS[three]})   (#{COLORS[four]})   |  #{hint_s}"
  end
end
