# Public: Creates an account and a matching support team.
#
class AccountCreationSvc

  # Public: Create an AccountTeam and a matching Account.
  def self.create(name, domain, account_typ = "enterprise")
    account = nil
    ActiveRecord::Base.transaction do
      account_team = Team.create(name: name, subdomain: 'account', typ: 'account', logo_text: name)
      account = Account.create(name: name, domain: domain, typ: account_typ, account_team_id: account_team.id)
      account_team.update_attributes account_id: account.id
    end
    account
  end

end