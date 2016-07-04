class Display
  def generate_page(score)
    template = my_template(score)
    score_binding = binding
    score_binding.local_variable_set(:score, score)
    ERB.new(template).result(score_binding)
  end

  def my_template(file_name)
    path = File.expand_path("view/score.html.erb")
    File.read(path)
  end
end
