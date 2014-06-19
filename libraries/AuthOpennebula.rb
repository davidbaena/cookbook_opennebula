require 'digest/sha1'

module ::AuthOpennebula
  def createPassSha1(password)
    return Digest::SHA1.hexdigest(password)
  end
end