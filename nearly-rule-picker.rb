input_rule = gets

parsed = input_rule.split('/').map {|a|
  a.gsub(/[BS]/, "")
}.map {|a|
  digits = a.scan(/(\d)/).flatten
  digits_with_letters = a.scan(/(\d)([cekainyqjrtwz]+)/)

  lonely_digits = digits - digits_with_letters.map(&:first)
  lonely_digits.each do |b|
    digits_with_letters.push([b])
  end

  sorted = digits_with_letters.sort {|l, r| l.first <=> r.first}

  not_existed_digits = (1..8).map(&:to_s) - sorted.map(&:first)
  not_existed_digits.each do |c|
    int_c = c.to_i
    sorted.insert(int_c - 1, [])
  end

  sorted
}

table = {
  "1" => "ce",
  "2" => "cekain",
  "3" => "cekainyqjr",
  "4" => "cekainyqjrtwz",
  "5" => "cekainyqjr",
  "6" => "cekain",
  "7" => "ce",
  "8" => ""
}

shuffled = parsed
1.times do
  which = rand(2)
  where = rand(shuffled[which].size)
  letters = table["#{where + 1}"]
  what = letters.split("").sample(rand(letters.size + 1)).uniq.join

  if rand(10) == 1
    shuffled[which][where][0] = nil
    shuffled[which][where][1] = nil
  else
    shuffled[which][where][0] = "#{where + 1}"
    shuffled[which][where][1] = what
  end
end

puts "B#{shuffled[0].join}/S#{shuffled[1].join}"

