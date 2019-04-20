class Cookies < Formula
  desc "Command-line tool for extracting cookies from the user's web browser"
  homepage "https://github.com/barnardb/cookies"
  url "https://github.com/barnardb/cookies.git",
      :tag      => "v0.2.0",
      :revision => "c20e30ffce15b1f778249c30e02eabcbd674d405"
  head "https://github.com/barnardb/cookies.git"

  depends_on "go" => :build

  def install
    system "./build.sh"
    bin.install "cookies"
  end

  test do
    system "#{bin}/cookies", "--accept-missing", "http://example.com"
  end
end
