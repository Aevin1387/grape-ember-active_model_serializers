module Grape
  module Ember
    module Formatter
      module ActiveModelSerializers
        class << self
          def add_meta_data_from_header(json, env)
            header = env["api.endpoint"].header

            if header["X-Total"].present?
              parsed_json = JSON.parse(json)
              parsed_json.merge!(
                "meta" => {
                  "total" => header["X-Total"],
                  "total-pages" => header["X-Total-Pages"],
                  "page" => header["X-Page"],
                  "per-page" => header["X-Per-Page"]
                }
              )
              json = parsed_json.to_json
            end

            json
          end

          def call(resource, env)
            json = Grape::Formatter::ActiveModelSerializers.call(resource, env)
            add_meta_data_from_header(json, env)
          end
        end
      end
    end
  end
end
