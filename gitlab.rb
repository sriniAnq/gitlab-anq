# Disable bundled NGINX and disable HTTPS as external NGINX will handle it
nginx['enable'] = false
nginx['listen_https'] = false

# Disable LetEncrypt Registration and SSL Certificate
letsencrypt['enable'] = false

# Disable the built-in Postgres
postgresql['enable'] = false

# Fill in the connection details for database.yml
gitlab_rails['db_adapter'] = 'postgresql'
gitlab_rails['db_encoding'] = 'utf8'
gitlab_rails['db_host'] = 'localhost'
# gitlab_rails['db_host'] = 'anq-ci-dev.anq.dev'
gitlab_rails['db_port'] = '5432'
gitlab_rails['db_username'] = 'postgres'
gitlab_rails['db_password'] = 'postgrespw'

# The gitlab default is to use 6 unicorn worker processes. By reducing the number of workers to 2, my gitlab memory consumption decreased by approximately 60%
GITLAB_OMNIBUS_CONFIG: "unicorn['worker_processes'] = 2"
# Most small installation do not need Prometheus, the monitoring tool integrated into Gitlab
GITLAB_OMNIBUS_CONFIG: "prometheus_monitoring['enable'] = false"
# sidekiq is the background job processor integrated into Gitlab. The default concurrency is 25. I recommend reducing it.
GITLAB_OMNIBUS_CONFIG: "sidekiq['concurrency'] = 2"

# External URL and root password configuration
external_url 'localhost:8008'
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password').gsub("\n", "")
