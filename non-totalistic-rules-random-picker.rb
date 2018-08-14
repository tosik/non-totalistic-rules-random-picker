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

a = table.map {|kv|
  num = kv[0]
  letters = kv[1].split("").push("")

  patterns = (1..13).map {|len|
    letters.combination(len).map {|combi|
      combi.join("")
    }
  }.uniq.map {|letter|
    letter.product([num]).map {|elem|
      elem.reverse.join
    }
  }

  patterns.flatten.uniq
}

sizes = (0..table.size-1).map {|t|
  a[t].push("").size
}
count = sizes.inject {|d, n| d * n}

puts ["B", "S"].map {|prefix|
  pick = rand(count)
  s1 = pick % sizes[0]
  s2 = pick / sizes[0] % sizes[1]
  s3 = pick / sizes[0] / sizes[1] % sizes[2]
  s4 = pick / sizes[0] / sizes[1] / sizes[2] % sizes[3]
  s5 = pick / sizes[0] / sizes[1] / sizes[2] / sizes[3] % sizes[4]
  s6 = pick / sizes[0] / sizes[1] / sizes[2] / sizes[3] / sizes[4] % sizes[5]
  s7 = pick / sizes[0] / sizes[1] / sizes[2] / sizes[3] / sizes[4] / sizes[5] % sizes[6]
  s8 = pick / sizes[0] / sizes[1] / sizes[2] / sizes[3] / sizes[4] / sizes[5] / sizes[6] % sizes[7]

  "#{prefix}#{a[0][s1]}#{a[1][s2]}#{a[2][s3]}#{a[3][s4]}#{a[4][s5]}#{a[5][s6]}#{a[6][s7]}#{a[7][s8]}"
}.join("/")
