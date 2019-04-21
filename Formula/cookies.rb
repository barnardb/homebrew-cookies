class Cookies < Formula
  desc "Command-line tool for extracting cookies from the user's web browser"
  homepage "https://github.com/barnardb/cookies"
  url "https://github.com/barnardb/cookies.git",
      :tag      => "v0.2.1",
      :revision => "180be227fda81f2d05ec91fad5d246826854c909"
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
