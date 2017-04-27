Rails.application.routes.draw do
  get("/omnicalc_params", {:controller => "calculations", :action => "main_page"})
  
  get("/flexible/square/:number",{:controller => "calculations", :action => "flexible_square"})
  get("/flexible/square_root/:number", {:controller => "calculations", :action => "flexible_square_root"})
  get("/flexible/payment/:rate/:years/:principal", {:controller => "calculations", :action => "flexible_payment"})
  get("/flexible/random/:min/:max", {:controller => "calculations", :action => "random_number"})

  get("/square/new",{:controller => "calculations", :action => "square_form"})
  get("/square/results", {:controller => "calculations", :action => "square_results"})

  get("/square_root/new", {:controller => "calculations", :action => "square_root_form"})
  get("/square_root/results", {:controller => "calculations", :action => "square_root_results"})

  get("/payment/new", {:controller => "calculations", :action => "payment_form"})
  get("/payment/results", {:controller => "calculations", :action => "payment_results"})

  get("/random_number/new", {:controller => "calculations", :action => "random_number_form"})
  get("/random_number/results", {:controller => "calculations", :action => "random_number_results"})

  get("/word_count/new", {:controller => "calculations", :action => "word_count_form"})
  get("/word_count/results", {:controller => "calculations", :action => "word_count_results"})

  get("/descriptive_stats/new", {:controller => "calculations", :action => "descriptive_stats_form"})
  get("/descriptive_stats/results", {:controller => "calculations", :action => "descriptive_stats_results"})
end
