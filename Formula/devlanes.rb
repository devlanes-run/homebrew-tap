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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.1/devlanes-0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "aca3a59dfd5a593dea9dd146478c0aa683dbf758d3ffc0d5fd587f67beea73af"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.1/devlanes-0.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "c15b67b366883d9091ff9f8a74026b27cd022b2812e2f1fdb725bd2c4b148f2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.1/devlanes-0.14.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c440adf71612f7e76c5fe76826a43e0ed5a1cd95bf72ba8a37b31d3c39bdfbb"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.1/devlanes-0.14.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a22d24dc824f58a9a3c168fa5b1f9a88653360bbf3df88a730f8d7f2fbadf85"
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
