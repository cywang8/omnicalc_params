class CalculationsController < ApplicationController
  
  def main_page
    render ("calculations/main_page.html.erb")
  end
  
  def flexible_square
    # Parameters: {"number"=>"8"}
    @user_num = params["number"].to_f
    render ("calculations/flexible_square.html.erb")
  end

  def flexible_square_root
    @user_num = params["number"].to_f
    @square_root = @user_num**0.5
    render("calculations/flexible_square_root.html.erb")
  end

  def flexible_payment
    @user_annual_rate = params["rate"].to_f
    @user_annual_rate_percentage = @user_annual_rate/10000
    @user_monthly_rate = @user_annual_rate_percentage/12
    @user_years = params["years"].to_f
    @user_months = @user_years*12
    @user_principal = params["principal"].to_f
    @monthly_payment = (@user_principal*@user_monthly_rate*((1+@user_monthly_rate)**@user_months))/(((1+@user_monthly_rate)**@user_months)-1)
    @monthly_payment_rounded = '%.2f' % @monthly_payment
    render("calculations/flexible_payment.html.erb")
  end

  def random_number
    @min = params["min"].to_f
    @max = params["max"].to_f
    @random = rand(@max) + @min
    render("calculations/random_number.html.erb")

  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square_results
    @user_num = params["user_num"].to_f
    render("calculations/square_results.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root_results
    @user_num = params["user_num"].to_f
    @square_root = @user_num ** 0.5
    render("calculations/square_root_results.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment_results
    @APR = params["annual_rate"].to_f
    @APR_percentage = @APR/100
    @number_of_years = params["number_of_years"].to_f
    @monthly_rate = @APR_percentage/12
    @months = @number_of_years*12
    @principal = params["principal"].to_f
    @monthly_payment = (@principal*@monthly_rate*((1+@monthly_rate)**@months))/(((1+@monthly_rate)**@months)-1)
    @monthly_payment_rounded = '%.2f' % @monthly_payment
    render("calculations/payment_results.html.erb")
  end

  def random_number_form
    render("calculations/random_number_form.html.erb")
  end

  def random_number_results
    @minimum = params["minimum"].to_f
    @maximum = params["maximum"].to_f
    @random_number = rand(@maximum) + @minimum
    render("calculations/random_number_results.html.erb")
  end

  def word_count_form
    render("calculations/word_count_form.html.erb")
  end

  def word_count_results
    @text = params["user_text"]
    @special_word = params["special_word"]

    # No spaces
    text_wo_space = @text.gsub(" ","")

    # No linefeeds, carriage returns, or tabs
    text_with_just_spaces = @text.gsub("\n","").gsub("\t","").gsub("\r","")
    
    # No spaces or linefeeds
    text_wo_space_linefeed = text_wo_space.gsub("\n","")
    
    # No spaces, linefeeds, or carriage returns
    text_wo_space_linefeed_carriagereturn = text_wo_space_linefeed.gsub("\r","")
    
    # No spaces, linefeeds, carriage returns, or tabs
    text_wo_all_including_tabs = text_wo_space_linefeed_carriagereturn.gsub("\t","")

    # Counts characters of user text including spaces but not linefeeds, carriage returns, or tabs
    @character_count_with_spaces = text_with_just_spaces.length

    # Counts characters of user text without spaces, linefeeds, carriage returns, or tabs
    @character_count_without_spaces = text_wo_all_including_tabs.length

    # Counts word count of user text
    words_separated = @text.downcase.split
    @word_count = words_separated.length

    # Creates variable to count instances of special word; strips special word of punctuation, spaces; and converts to downcase
    special_word_count = []

    # Uses .each to check if each word in new array equals special word
    words_separated.each do |word|
      stripped_word = word.gsub(/[^a-z0-9\s]/i, "")
      if stripped_word == @special_word.gsub(/[^a-z0-9\s]/i, "").downcase
      special_word_count.push(word)
      end
    end
    @occurrences = special_word_count.length
    render("calculations/word_count_results.html.erb")
  end

  def descriptive_stats_form
    render("calculations/descriptive_stats_form.html.erb")
  end

  def descriptive_stats_results
    #FILL IN
    render("calculations/descriptive_stats_results.html.erb")
  end

end
