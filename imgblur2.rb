#build an image class
class Image 
  def initialize(myArr)
    #create variable for the array
    @myArr = myArr 
    #create row and column
    @number_of_rows = myArr.length
    @number_of_columns = myArr[0].length
  end
  
  def output_image
    #loop through each item in array then join them
   @myArr.each{ |x| puts x.join(" ")}
  end

  #transformation causes any 1 in the image to cause the pixel to the left, right, above and below to become a 1.
  def blur
  #Create empty array
   find_ones = []
   @myArr.each_with_index do |rows, row|
       #puts "#{rows}: #{row}"
       rows.each_with_index do |number, col|
        #puts "#{number}: #{col}"
          #push into array
          find_ones << [row, col] if number == 1
          #puts "row : #{rows}: column: #{col}"
       end
   end
   find_ones.each do |row, col|
      #right, left, up, down
      @myArr[row][col +1] = 1 unless col >= @number_of_columns -1 
      @myArr[row][col -1] = 1 unless col == 0 
      @myArr[row -1][col] = 1 unless row == 0 
      @myArr[row +1][col] = 1 unless row >= @number_of_rows -1 
   end
 end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])


#output
puts 'Before'
image.output_image
puts '-------'
image.blur

#blur
puts 'After'
image.output_image


# ["A", "B", "C", "D"].each_with_index do |letter, index|
#   puts "#{index}: #{letter}"
# end
