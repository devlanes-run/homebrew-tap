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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.1/devlanes-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "5ae75a34d881ac7ca9235b2db5ed63e7fbe6f3708b3ebec75e9bbfdaf69ebefa"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.1/devlanes-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "6bf56a28de759c52fa2376b64e8f46825dc6e71db585ac828d838ce72aa157a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.1/devlanes-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b61411c22e2406ea8f6ee0f2c47fe6541dbe85c7f16607ded9981066ba5db210"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.8.1/devlanes-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "559e1757be5e22c417a3f2916fee8e88c2b7b68c58e472522a60167577f5e582"
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
