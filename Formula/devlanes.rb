class Devlanes < Formula
  desc "Development environments in Git worktree lanes"
  homepage "https://devlanes.run"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.1/devlanes-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "b429a42fd642b8b0c3bcb1303ac52a18fd3f008a809adccb90a655e2e0d58fc4"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.1/devlanes-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "b9f22f294a869732dc708da241bd04a13c59ea98bfeee13758a21669a3dc0b21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.1/devlanes-0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aba2125b5599e919df2ded454abcc0e6c6694d40b557ee07d20f6c592d7af141"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.1/devlanes-0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12961600b6c33d4a1f8f327d74acf1701bf908ce23e8c02ca52f7e6aee199d69"
    end
  end

  def install
    # devlanes looks for devlanes-hosts next to itself when `devlanes certs trust --hosts`
    # copies the helper to /usr/local/libexec, so both go into the same bin.
    bin.install "devlanes", "devlanes-hosts"
  end

  test do
    assert_match "devlanes #{version}", shell_output("#{bin}/devlanes --version")
    assert_match "build=release", shell_output("#{bin}/devlanes-hosts version")
  end
end
