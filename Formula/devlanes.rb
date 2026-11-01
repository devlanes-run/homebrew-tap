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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.0/devlanes-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "132b2676623b8312fe0046d00bb55f422c6043ab49388e4a4a1508eb407cd02b"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.0/devlanes-0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "1bac26e67c0fd04377ed1624110d3a09229781c4ae2093c76c697dd5b124f740"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.0/devlanes-0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ebe0a102e0da207c4330f4afe185eacdea2c465327409ca2b95b55fe0fa19b2d"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.0/devlanes-0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6258cb3531d62cc7931a5a713ad869c8425905455d71910d3b0e40048d439d6"
    end
  end

  def install
    # devlanes looks for devlanes-hosts next to itself when `devlanes setup`
    # copies the helper to /usr/local/libexec, so both go into the same bin.
    bin.install "devlanes", "devlanes-hosts"
  end

  test do
    assert_match "devlanes #{version}", shell_output("#{bin}/devlanes --version")
    assert_match "build=release", shell_output("#{bin}/devlanes-hosts version")
  end
end
