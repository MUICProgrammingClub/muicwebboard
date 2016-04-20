namespace :create_role do
  task :seed => :environment do
    admin_role = Role.create(name: "admin")
    moderator_role = Role.create(name: "moderator")
    member_role = Role.create(name: "member")
  end
end
