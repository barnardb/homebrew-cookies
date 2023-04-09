class Cookies < Formula
  desc "Command-line tool for extracting cookies from the user's web browser"
  homepage "https://github.com/barnardb/cookies"
  url "https://github.com/barnardb/cookies.git", tag: "v0.5.1"
  license "MIT"
  head "https://github.com/barnardb/cookies.git", branch: "main"

  depends_on "go" => :build

  def install
    system "./build.sh", "0.5.1"
    bin.install "cookies"
  end

  def test_command(*command, exit_status: 0, stdout: "", stderr: "")
    require "open3"
    full_command = ["#{bin}/#{command[0]}", *command[1..]]
    actual_stdout, actual_stderr, status = Open3.capture3(*full_command)
    assert_equal exit_status, status.exitstatus, "exit status for #{full_command} with #{status}"
    assert_match stdout, actual_stdout, "stdout for #{full_command} with #{status}"
    assert_match stderr, actual_stderr, "stderr for #{full_command} with #{status}"
  end

  test do
    test_command("cookies", "--version", stdout: "0.5.1\n")

    test_command("cookies", "--help",
      stdout: %r{usage: .+/cookies \[options…\] <URL> \[<cookie-name>\]\n\n.+\n})

    test_command("cookies", "http://example.com/this/path/is/assumued/not-to-exist",
      exit_status: 1)

    test_command("cookies", "--accept-missing", "http://example.com/this/path/is/assumued/not-to-exist")

    test_command("cookies", "--verbose", "--accept-missing", "http://example.com/this/path/is/assumued/not-to-exist",
      stderr: %r{Looking for cookies for URL http://example.com/this/path/is/assumued/not-to-exist\n.+\n})
  end
end
