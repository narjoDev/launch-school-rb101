def is_an_ip_number?(word)
  (0..255).include? word.to_i
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words.size == 4

  until dot_separated_words.empty?
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

p dot_separated_ip_address?('4.5.5')
p dot_separated_ip_address?('1.2.3.4.5')
p dot_separated_ip_address?('7.15.255.0')
p dot_separated_ip_address?('407.15.255.0')
