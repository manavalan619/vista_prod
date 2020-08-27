class AdminConstraints
  def initialize
    @subdomains = %w[admin admin-staging ngrok]
  end

  def matches?(request)
    true
  end
end
