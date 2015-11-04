namespace :config do
  namespace :upload do
    desc 'Upload Rails config'
    task :rails do
      on roles(:all) do
        upload! File.expand_path('../../../../config/database.yml', __FILE__), "#{shared_path}/config/database.yml"
        upload! File.expand_path('../../../../config/secrets.yml', __FILE__), "#{shared_path}/config/secrets.yml"
        upload! File.expand_path('../../../../config/application.yml', __FILE__), "#{shared_path}/config/application.yml"
        upload! File.expand_path('../../../../config/api.yml', __FILE__), "#{shared_path}/config/api.yml"
      end
    end

    desc 'Upload upstart config'
    task :upstart do
      on roles(:all) do
        upload_template 'unicorn-upstart.conf.erb', "#{shared_path}/unicorn-upstart.conf"
      end
    end

    desc 'Upload init.d script'
    task :init do
      on roles(:all) do
        upload_template 'unicorn-init.erb', "#{shared_path}/unicorn-init"
      end
    end

    desc 'Compile and upload nginx configuration'
    task :nginx do
      on roles(:app) do
        upload_template 'nginx.conf.erb', "#{ shared_path }/#{fetch(:application)}-nginx.conf"
      end
    end

  #   desc 'Compile and upload version config'
  #   task :version do
  #     on roles(:all) do
  #       require_relative '../../../config/initializers/version.rb'
  #       string = StringIO.new(LeaderUnited::Version.new.to_yaml)
  #       upload! string, "#{release_path}/config/version.yml"
  #     end
  #   end
  # end

  namespace :download do
    desc 'Download figaro configuration'
    task :figaro do
      on roles(:all) do
        download! "#{shared_path}/config/application.yml", File.expand_path('../../../../config/application.yml', __FILE__)
      end
    end
  end


  desc 'Upload all configs'
  task :upload do
    on roles(:all) do
      invoke 'config:upload:nginx'
      invoke 'config:upload:upstart'
      invoke 'config:upload:rails'
    end
  end
end

def upload_template(from, to)
  template_path = File.expand_path("../../templates/#{from}", __FILE__)
  template = ERB.new(File.new(template_path).read).result(binding)
  upload! StringIO.new(template), to
end
