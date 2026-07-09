class AgentLens < Formula
  desc "macOS daemon + CLI for code diagnostics and linting"
  homepage "https://github.com/tideline-studio/agent-lens"
  url "https://github.com/tideline-studio/agent-lens/archive/refs/tags/0.0.1.tar.gz"
  sha256 "72d0d5a680adc4bba2eb3c3d35729fbfd622dae32387d1ee5be0376e31547661"
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
