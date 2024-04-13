require 'active_record'

# ActiveRecord::Base.default_timezone = :utc
# ActiveRecord::Base.establish_connection(ServiceApp.config.database[ServiceApp.env])


ActiveRecord::Base.configurations = ServiceApp.config.database.to_h.stringify_keys

ActiveRecord::Base.establish_connection(ServiceApp.env.to_sym)

ActiveRecord::Base.logger = ServiceApp.logger
