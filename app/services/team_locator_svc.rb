class TeamLocatorSvc

  def self.find(domain, subdomain = "")
    if subdomain.empty?
      alt_team = Team.find_by_altdomain(domain)
      team = alt_team.nil? ? Account.find_by_domain(domain).try(:account_team) : alt_team
      [team.try(:account), team]
    else
      account = Account.find_by_domain(domain)
      return [nil, nil] if account.nil?
      [account, Team.where(subdomain: subdomain).where(account_id: account.id).first]
    end
  end

end