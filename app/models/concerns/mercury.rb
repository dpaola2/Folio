module Mercury
  def fetch
    run_path = Rails.root.join("node_modules", "@postlight", "mercury-parser", "cli.js")
    JSON.parse(`#{run_path} #{url}`)
  end
end