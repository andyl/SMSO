class AccountDomainValidator < ActiveModel::Validator
  def validate(record)
    altdomain = record.altdomain
    return if altdomain.blank?
    if Account.where(domain: altdomain).count != 0
      record.errors[:base] << "Alt-domain (#{altdomain}) has already been taken"
    end
  end
end