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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.0/devlanes-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "2eff6c8088fc8d97e232e16542ada1eb2c06bbdd3ee3803162869e0427330830"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.0/devlanes-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "625e9c346365d22e12cf0c4473163a329161d21f18a23aabd970fd3196467152"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.0/devlanes-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14e492665016df63900b6732d555e97260861aeb03abbb15cb5cc8c7befb688b"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.0/devlanes-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2de88c4e8716960c1c6c51d62644f27cf82ee7f26358c64c678aad2ec04c3df6"
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
