class CalculationsController < ApplicationController

  def flexible_square
    # Parameters: {"number"=>"8"}
    @user_num = params["number"].to_f
    render ("calculations/flexible_square.html.erb")
  end

  def flexible_square_root
    @user_num = params["number"].to_f
    render("calculations/flexible_square_root.html.erb")
  end

  def flexible_payment
    @user_annual_rate = params["rate"]/10000.to_f
    @user_monthly_rate = @user_annual_rate/12
    @user_years = params["years"]
    @user_months = @user_years*12
    @user_principal = params["principal"].to_f
    @monthly_payment = (@user_principal*@user_monthly_rate*((1+@user_monthly_rate)**@user_months))/(((1+@user_monthly_rate)**@user_months)-1)
    render("calculations/flexible_payment.html.erb")
  end

  def random_number
    @min = params["min"]
    @max = params["max"]
    @random = rand(@min..@max)
    render("calculations/random_number.html.erb")

  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square_results
    @user_num = user_num.to_f
    render("calculations/square_results.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root_results
    @user_num = user_num.to_f
    render("calculations/square_root_results.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment_results
    @APR = annual_rate.to_f
    @number_of_years = number_of_years.to_f
    @monthly_rate = @APR/12
    @months = @number_of_years*12
    @principal = principal.to_f
    @monthly_payment = (@principal*@monthly_rate*((1+@monthly_rate)**@months))/(((1+@monthly_rate)**@months)-1)
    render("calculations/payment_results.html.erb")
  end

  def random_number_form
    render("calculations/random_number_form.html.erb")
  end

  def random_number_results
    @minimum = minimum.to_f
    @maximum = maximum.to_f
    @random_number = rand(@minimum..@maximum)
    render("calculations/random_number_results.html.erb")
  end

  def word_count_form
    render("calculations/word_count_form.html.erb")
  end

  def word_count_results
    @text = text
    @special_word = special_word

    # Take out spaces from user text
    text_wo_space = @text.gsub(" ","")

    #Also take out linefeed, carriage return, and tabs
    text_wo_feed_or_return = @text.gsub("\n","").gsub("\t","")
    text_wo_space_linefeed = text_wo_space.gsub("\n","")
    text_wo_space_linefeed_carriagereturn = text_wo_space_linefeed.gsub("\r","")
    text_wo_all_including_tabs = text_wo_space_linefeed_carriagereturn.gsub("\t","")

    # Counts characters of user text including spaces but not linefeeds, carriage returns, or tabs
    @character_count_with_spaces = text_wo_feed_or_return.length

    # Counts characters of user text without spaces, linefeeds, carriage returns, or tabs
    @character_count_without_spaces = text_wo_all_including_tabs.length

    # Counts word count of user text
    words_separated = @text.downcase.split
    @word_count = words_separated.length

    # Creates variable to count instances of special word & strips special word of punctuation, spaces, and converts to downcase
    special_word_count = []

    # Uses .each to check if each word in new array equals special word
    words_separated.each do |word|
      if word == @special_word.gsub(/[^a-z0-9\s]/i, "").downcase
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
