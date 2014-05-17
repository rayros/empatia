namespace :db do
  desc "Add admin user."
  task add_admin: :environment do
    admin = Admin.create!(email: ENV['ADMIN_EMAIL'],
                  password: ENV['ADMIN_PASSWD'],
                  password_confirmation: ENV['ADMIN_PASSWD'])
  end
end
