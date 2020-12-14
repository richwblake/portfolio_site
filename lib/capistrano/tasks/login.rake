task c: :console

desc "Open Rails console on a server based on the deployment stage"
task :console do
  on roles(:app) do |server|
    env  = fetch(:rails_env)
    user = fetch(:user)
    path = fetch(:deploy_to)

    uri = [
      server.user,
      server.user && '@',
      server.hostname,
      server.port && ":",
      server.port
    ].compact.join

    console_cmd = "$HOME/.rbenv/shims/bundle exec rails console -e #{env}"

    exec("ssh -t #{uri} 'cd #{path}/current && #{console_cmd}'")
  end
end

