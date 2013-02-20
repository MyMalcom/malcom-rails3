module Malcom
  extend self

  class Railtie < Rails::Railtie
    initializer "malcom.load-config" do
      config_file = Rails.root.join("config", "malcom.yml")
      raise "Malcom config file not present or not readable (#{config_file})." unless config_file && config_file.file?
      Malcom.settings = YAML.load(ERB.new(File.new(config_file).read).result)[Rails.env]
    end
  end

  def settings
    @settings ||= {}
  end

  def settings=(settings)
    @settings = settings
  end
end

