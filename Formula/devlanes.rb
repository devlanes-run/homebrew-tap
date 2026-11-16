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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.0/devlanes-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "23e0c1d919f922fdda8458675221c77bd97b0fa0047da179cb308a05249c50ea"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.0/devlanes-0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "38e6311c7f72121c9b9cd44cfd7229af3e1dcc1000a9778b140cd13193e8ffff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.0/devlanes-0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a1d92b459ebdb3f8892001185f1e4fc584f23203dfcde9bb6377cb3b10f49fb"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.0/devlanes-0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3858bb13428e3108b2bd95e2807679a54a39f63c339a328687d5155245ba3cad"
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
