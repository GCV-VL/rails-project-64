# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://f4476f0f106e4281a8d95c16cb408ba3@o4504620429475840.ingest.sentry.io/4504620432162816'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # # or
  # config.traces_sampler = lambda do |context|
  #   true
  # end
end
