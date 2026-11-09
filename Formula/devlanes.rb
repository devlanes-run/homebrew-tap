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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.0/devlanes-0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "8259dce6216cbd052933142537c493d76fa5ecce4cbd26105df8bd9080b27cf5"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.0/devlanes-0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "71d2f4be44be65262b6c32aeef229860118f91478c125cf73d42b7803b3114aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.0/devlanes-0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dcc66df3456ca6e85fef4358c8213bb9179a227be9d9329fa8bba42f33de9d21"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.0/devlanes-0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8674000e7f9adc723d4d2bea32a388ab7979c9aaa30d165f5504565b62b818a1"
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
