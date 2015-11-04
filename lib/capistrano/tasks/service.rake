namespace :service do  
  %i(start stop restart status reload).each do |action|
    desc "Run 'service #{fetch(:application)} #{action}' on remote host"
    task action do
      on roles(:all) do
        execute "sudo /sbin/#{action} #{fetch(:application)}"
      end
    end
  end

  namespace :init do
    %i(start stop restart status reload).each do |action|
      desc "Run init script for #{fetch(:application)} #{action} on remote host"
      task action do
        on roles(:all) do
          execute "/etc/init.d/#{fetch(:application)} #{action} "
        end
      end
    end
  end
  
end
