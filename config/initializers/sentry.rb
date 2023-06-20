Sentry.init do |config|
  config.dsn = 'https://a153169869454560ab598968526c5969@o4504932332011520.ingest.sentry.io/4504932335550464'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end