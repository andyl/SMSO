class AccountDomainValidator < ActiveModel::Validator
  def validate(record)
    alt_domain = record.alt_domain
    return if alt_domain.blank?
    if Account.where(domain: alt_domain).count != 0
      record.errors[:base] << "Alt-domain name (#{alt_domain}) has been taken"
    end
  end
end