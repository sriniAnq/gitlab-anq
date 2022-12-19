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
# gitlab_rails['db_host'] = 'anq-ci-dev.postgres.database.azure.com'
# gitlab_rails['db_host'] = 'anq-ci-dev.anq.dev'
# gitlab_rails['db_port'] = '5432'
# gitlab_rails['db_username'] = 'anq_mzxnvio'
# gitlab_rails['db_password'] = '2fPE%&G4#gRR*4TeTg'

gitlab_rails['db_host'] = 'postgresdb'
gitlab_rails['db_port'] = '5432'
gitlab_rails['db_username'] = 'postgres'
gitlab_rails['db_password'] = 'postgrespw'


# External URL and root password configuration
external_url 'localhost:8008'
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password').gsub("\n", "")
