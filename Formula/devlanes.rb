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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.2/devlanes-0.11.2-aarch64-apple-darwin.tar.gz"
      sha256 "d344455ab2d8c81d1a1f65759c49c710ad90a4cb5db75acf198fa19a9d251633"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.2/devlanes-0.11.2-x86_64-apple-darwin.tar.gz"
      sha256 "d41ffeb3c7d5b703abdfd0e6ad955ec2a50a26fbeb1c8eb9ef1636c1f55a8b31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.2/devlanes-0.11.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4326faec2631b17e4048392e0c994877e81a06d1431ef79d41464cd35f3a97ad"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.2/devlanes-0.11.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7013ba40a61b6fb154e584eaea1c6f708c1b5df8cbfde4dffeda3618195cdfee"
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
