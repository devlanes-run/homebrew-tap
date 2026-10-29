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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.9.0/devlanes-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "65d4a5a95a8ac061679dbe374c519ceb1ed63bed1b86852338efb0049e190a87"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.9.0/devlanes-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "79552baa6557cc30eeb606d6e21f6e6a3105775266dacc0bbefb5fb446c56188"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.9.0/devlanes-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45238d664044a995bb30bf37269d33bff372ceb65d3b7d9f77e840a2d2afe564"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.9.0/devlanes-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b297846c68a7ebaf9c5700b92a898845a4202f97d11b6a3bb3bd0d2b722a640"
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
