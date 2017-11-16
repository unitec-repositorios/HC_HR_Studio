class CreateAdminService
  def call
    User.find_or_create_by!(email: "admin@admin.com",
                            name: "admin") do |user|
      user.password = "admin1"
      user.password_confirmation = "admin1"
      user.admin!
    end
  end
end
