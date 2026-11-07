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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.12.0/devlanes-0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "d5a6e2ea9a94d1e2255f87c48ee91f219b61b5a73c0586e54184a55cbc83d7ff"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.12.0/devlanes-0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "e3102281e05a0b4960a7b0cf35c828cd28304ae10e9c11a5cd61bb73cabd1ffd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.12.0/devlanes-0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca8dfc65abc68aeb458a4740cd71851b1746bc0128f929d55284ae678fe0df17"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.12.0/devlanes-0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec4c27c9c905601fc1b8482c4b44fb21f0430be4c73c071b9562990def76c4c8"
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
