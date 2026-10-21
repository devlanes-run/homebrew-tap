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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.1.0/devlanes-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bbdf2a3d6edc09dda9c348fc684f3adf7fcc859ac414cd83ae4c3eceae66311f"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.1.0/devlanes-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3bd3256a3f86ecf7aee0b5abbf3bdc13e5f4243a8042c0c6c9123d13800bae3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.1.0/devlanes-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec832d0886be6a43861d7c18e6565989672dec46df8a900a0f709b54cb0d989c"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.1.0/devlanes-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f9dd97f58753968be674373715763715006e4080f6c26d4b91706abf3c2cfec"
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
