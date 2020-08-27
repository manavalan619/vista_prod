class PartnerConstraints
  def initialize
    @subdomains = %w[partners partners-staging]
  end

  def matches?(request)
    true
  end
end
