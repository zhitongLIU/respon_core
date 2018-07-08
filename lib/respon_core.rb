require 'respon_core/version'

module ResponCore
  # Your code goes here...
end

Dir['./concepts/**/*.rb'].each { |f| require f }
Dir['./lib/**/*.rb'].each { |f| require f }
Dir['./formators/**/*.rb'].each { |f| require f }
