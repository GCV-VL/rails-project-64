# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://fbf2c50cb3187f4bef6bf47c9c09e10b@o4504932332011520.ingest.sentry.io/4505781799550976'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
