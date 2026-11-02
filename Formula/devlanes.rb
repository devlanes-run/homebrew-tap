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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.1/devlanes-0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "43ce53c04ec7add5ba1cc20d2d1fead4b7c701305e3c353beb086d3c3fd2e020"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.1/devlanes-0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "4f66ef9a47837e5619347cc1f781b31e847575cf8ab910ddc2b2471d6832d5cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.1/devlanes-0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c70bde583a52b038473ad2b5a6f49543efee68516cd1b57c44f57e69018a4ca9"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.1/devlanes-0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "921b70032e827023e1a9d33e653e510954d60d47b054dc3e58a590508a50d784"
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
