class Share::Request
  prepend SimpleCommand

  def initialize(branch:, user:, via: nil)
    @share = Share.new(branch: branch, user: user, via: via)
    @existing_share = Share.find_by(
      branch: branch,
      user: user,
      status: ['requested', 'authorised']
    )
  end

  def call
    if @existing_share
      errors.add(:status, 'Already requested') if requested?
      errors.add(:status, 'Already authorised') if authorised?
      return false
    end

    return @share if @share.request!
    @share.errors.map { |k, v| errors.add(k, v) }
    @share
  end

  private

  def requested?
    @existing_share.status == 'requested'
  end

  def authorised?
    @existing_share.status == 'authorised'
  end
end
