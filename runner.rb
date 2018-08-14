#!/usr/bin/env ruby

output_path = ARGV[0]
if output_path == nil
  puts "Usage\n  ./runner.rb <output Golly RLE path>"
  exit -1
end

random = `ruby non-totalistic-rules-random-picker.rb`.chomp

while true do
  puts "Press <Enter> to generate rle file (#{output_path})."
  STDIN.gets
  puts "Generated rule is \"#{random}\""

  IO.popen("ruby generate-random-rle.rb", "r+") do |io|
    io.puts random
    io.close_write
    output = io.readlines.join
    File.write(output_path, output)
  end

  random = IO.popen("ruby nearly-rule-picker.rb", "r+") do |io|
    io.puts random
    io.close_write
    io.gets.chomp
  end

end

