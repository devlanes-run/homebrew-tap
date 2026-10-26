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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.4/devlanes-0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "9eeb3e70ea23a8ff1f86735b4548ab8b750e943aff4acd1358bfbd6dcf9b7588"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.4/devlanes-0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "46a23aeab5080ebb8c13bd2508b4d815c4edde5f4299d8c1a5bf79a65b705b54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.4/devlanes-0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f620aba49a37fbd8475398df51f0fd95da5307a1f6925be5cfbbcfb92305751e"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.4/devlanes-0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9a0190afcccc7684e078f57b6f3e724a691f289655931ff92e2280254b3e89a"
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
