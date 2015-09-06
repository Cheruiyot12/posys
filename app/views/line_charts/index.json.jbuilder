json.array!(@line_charts) do |line_chart|
  json.extract! line_chart, :id, :month_name, :year, :total_income
  json.url line_chart_url(line_chart, format: :json)
end
