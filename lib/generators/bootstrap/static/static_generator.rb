require 'rails/generators'

module Bootstrap
  module Generators
    class StaticGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates bootstrap HTML static pages"
      argument :component_name, :type => :string, :default => "about",
               :banner => "navbar, navbar-devise, carousel"

      attr_reader :app_name

      def generate_static
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first
        ext = app.config.generators.options[:rails][:template_engine] || :erb
        copy_file "#{component_name}.html.#{ext}", "app/views/statics/#{component_name}.html.#{ext}"
      end
    end
  end
end