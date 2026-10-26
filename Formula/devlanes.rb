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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.0/devlanes-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "44fbb8f0e532e6599376a5f57eeffd59f276ba172370a27746f1283ab7521f3e"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.0/devlanes-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "a5396e795e44e9dbfa88d92039d4d47b0cac5665e91ab3e0f2d4a97a3a3df5a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.0/devlanes-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ea5138cba28a264b78cc3eded17b4f4e2a00900a7e49efa153eaa83146a40cd"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.0/devlanes-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "858ee300f9a7f5bda18163112d290797ae79a192b5f48fbb21467e16e4ae4541"
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
