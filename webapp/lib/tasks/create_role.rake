namespace :create_role do
  task :seed => :environment do
    if Role.count == 0
      admin_role = Role.create(name: "admin")
      moderator_role = Role.create(name: "moderator")
      member_role = Role.create(name: "member")
    end
  end
end
