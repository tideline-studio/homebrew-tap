class SourcekitXcodeBsp < Formula
  desc "Build Server Protocol server for Xcode projects"
  homepage "https://github.com/tideline-studio/sourcekit-xcode-bsp"
  url "https://github.com/tideline-studio/sourcekit-xcode-bsp/archive/refs/tags/0.0.1.tar.gz"
  sha256 "a432975f050608e6e2f58ab550fd1693cde1dca832a28a89cbd18b0c5beea19d"
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
