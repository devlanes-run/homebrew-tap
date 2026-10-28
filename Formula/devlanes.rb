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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.1/devlanes-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "f628c04717d8430956930675c38748103922aa32af36f5ee4f9a1e5eae60448b"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.1/devlanes-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "5085fe45f411c7ad509cc2d8f557b927f310c5706b7cecf7c221b0e3a0a59569"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.1/devlanes-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be211365baf6e03747f00b58805c6fe2d28afc827ece950499b8e5c33145ea06"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.1/devlanes-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a6df7695a1a21016d3753de468caf61b776c83fb9844a3f142ab54d5c863659"
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
