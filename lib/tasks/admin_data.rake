namespace :db do
  desc "Add admin user."
  task add_admin: :environment do
    login = Rails.application.secrets.admin_login
    pass = Rails.application.secrets.admin_login
    admin = Admin.create!(email: login,
                  password: pass,
                  password_confirmation: pass)
  end
end
