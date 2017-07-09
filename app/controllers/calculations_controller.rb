class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @word_count = @text.split.count

    @character_count_with_spaces = @text.length
      a = @text.length
      b = @text.count(" ")
      
    @character_count_without_spaces = a - b
      # characters with spaces minus number of spaces

    @occurrences = @text.split.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    apr = params[:annual_percentage_rate].to_f
    years = params[:number_of_years].to_i
    principal = params[:principal_value].to_f
    monthly = apr / 12
    months = years * 12
    
    @monthly_payment = ((monthly / 100) * principal) / (1 - (1 / ((1 + (monthly / 100)) ** months)))
        
        # (((apr / 100) / 12) * principal) / ((1-(1 + ((apr / 100) / 12))) ** ((1 / years)/ 12))
        # @monthly_payment = ((apr / 100 / 12) * principal) / ((1-(1 + (apr / 100 / 12))) ** (1 / years / 12))
        # / ((1-((1 + (6.5 / 100 / 12)) ** (1 / years / 12))
        # ((apr / 100 / 12) * principal) / (1-((1+(6.5 / 100 / 12))** (1 / (years / 12))
        # (((principal * (apr / 100)) * years) + principal) / (12* years)
        # (((principal * (apr / 100)) * years) + principal) / (12* years)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = (@ending - @starting)
    seconds = @seconds
    
    @minutes = (seconds / 60)
    
    
    @hours =  ((seconds / 60) / 60)
    
    
    @days =  (((seconds / 60) / 60) / 24)
    
    
    @weeks = ((((seconds / 60) / 60) / 24) / 7)
    
    
    @years = (((((seconds / 60) / 60) / 24) / 7) / 52)
    

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort
    sorted = @numbers.sort
    @count = @numbers.count
    count = @numbers.count
    @minimum = @numbers.min
    min = @numbers.min
    @maximum = @numbers.max
    max = @numbers.max
    @range = max - min

    def median(array)
      sorted = array.sort
      len = sorted.length
      (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
    @median = median(@numbers)
    
  #     def median(array)
  #   ascend = array.sort
  #   if ascend % 2 != 0
  #     (ascend.length + 1) / 2.0
  #   else
  #     ((ascend.length/2.0) + ((ascend.length + 2)/2.0) / 2.0)
  #   end
  # end
    
    
  #   count.odd?
  #   subtractor = (@numbers.count - 1) / 2  
  #   digit = count - subtractor
  #   @numbers[digit]
  #   # sort in order...count # of values...determine if even or odd...
  
  # def media(numbers)
  # list = sorted.length
  # if list %2 != 0
  #   (list + 1) / 2.0
  # else
  #   even = ((list.to_f + 2) / 2) + ((list.to_f / 2)
  #   return (even/2)

    @sum = @numbers.sum
    sum = @numbers.sum

    @mean = sum / count

    variance = @numbers.map { |i| (i - @mean)**2 }.sum / @count
    @variance = variance

    stdv = @variance**0.5    
    @standard_deviation = stdv

    @mode = @numbers.sort
    .chunk {|e| e}
    .map { |e,a| [e, a.size] }
    .sort_by { |_,cnt| -cnt }
    .chunk(&:last)
    .first
    .last
    .map(&:first)
    .last

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
