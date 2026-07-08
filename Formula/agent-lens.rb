class AgentLens < Formula
  desc "macOS daemon + CLI for code diagnostics and linting"
  homepage "https://github.com/tideline-studio/agent-lens"
  url "https://github.com/tideline-studio/agent-lens/archive/refs/tags/0.0.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "Apache-2.0"
  head "https://github.com/tideline-studio/agent-lens.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    libexec.install ".build/release/alensd"
    libexec.install ".build/release/alens"
    bin.install_symlink libexec/"alensd"
    bin.install_symlink libexec/"alens"
  end

  test do
    assert_match "Live code intelligence for agents.", shell_output("#{bin}/alens --help 2>&1")
  end
end
