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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.0/devlanes-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "09ddcfab9a1dcc52aec5d233d17ceb5d25478c3a4171da9caa7db6dc20438978"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.0/devlanes-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "9053747bb1266507f9902772b01fa4de0a3872e7f46790d902ade809962c575d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.0/devlanes-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b18aa03adc836ed9412a0cf60d30eaeeca5a08fe80010fc54ac76470f95abc48"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.0/devlanes-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6e5f94ffc53b6ba7b7220dd4d13d8c45901c80e673a24841be2e92e65f16e8c"
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
