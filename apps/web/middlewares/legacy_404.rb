module Web
  module Middlewares
    class Legacy404
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, response = @app.call(env)

        if status == 404
          request = Rack::Request.new(env)
          template = get_template(request.path)

          env.delete('hanami.action') if ENV['WORKAROUND']

          return response(headers, view(template))
        end
        [status, headers, response]
      end

      def get_template(path)
        templates = {
          default: 'apps/web/templates/404/default.html.erb',
          other: 'apps/web/templates/404/other.html.erb',
        }

        is_other = File.basename(URI(path).path) == 'other'

        template_path = templates.fetch(is_other ? :other : :default)
        Hanami::View::Template.new(template_path)
      end

      def view(template)
        locals = Hash[]
        Web::Views::Legacy404.new(template, locals)
      end

      private

      def response(headers, view)
        response = Rack::Response.new([], 404, headers)
        response.write(view.render)
        response['Content-Type'] = 'text/html'
        response.finish
      end
    end
  end
end
