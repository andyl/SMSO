class UserMenuSvc

  def self.header_nav(user, team, env)

    memberships = user.memberships.select do |mem|
      mem.team_id != team.id
    end

    mem_links = memberships.map do |mem|
      team_link(mem.team, env)
    end.join

    logout = "<li><a href='/logout' class='danger'><i>log out</i></a></li>"
    mem_links + logout
  end

  def self.team_link(team, env)
      "<li><a href='#{team_url(team, env)}'>#{team.name}</a></li>"
  end

  def self.team_url(team, env)
    port = env["SERVER_PORT"].blank? ? "" : ":#{env["SERVER_PORT"]}"
    base = "#{team.subdomain}.#{team.account.try(:domain)}".gsub(/^account./,'')
    "http://#{base}#{port}"
  end

end