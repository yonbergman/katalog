class ProjectFromEmail
  def self.create(email_data)
    user = User.find_by(email: email_data.from)
    if user
      return nil if user.default_organization.nil?

      title = email_data.subject
      subtitle = email_data.text_body.split("\n").first
      project = Project.new(title: title, subtitle: subtitle, ideator: user, organization_id: user.default_organization.id)
      user.projects << project
      user.save!
      project
    end
  end
end