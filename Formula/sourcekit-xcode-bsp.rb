class SourcekitXcodeBsp < Formula
  desc "Build Server Protocol server for Xcode projects"
  homepage "https://github.com/tideline-studio/sourcekit-xcode-bsp"
  url "https://github.com/tideline-studio/sourcekit-xcode-bsp/archive/refs/tags/0.0.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "Apache-2.0"
  head "https://github.com/tideline-studio/sourcekit-xcode-bsp.git", branch: "main"

  depends_on :xcode => ["16.0", :build]
  depends_on :macos => :sequoia

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/sourcekit-xcode-bsp"
  end

  test do
    assert_match "xcode-bsp", shell_output("#{bin}/sourcekit-xcode-bsp --help 2>&1")
  end
end
