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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.2/devlanes-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "853911b0885651aa42f0356cf72de7594601d5fe62bf8a3e3a252be3f5ee7f97"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.2/devlanes-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "4a431b0bb5e0f608aaf6264e66f2ce6d58089d16a4cb283a419df775fd4114c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.2/devlanes-0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7ea04ba217a62a9f84ef4a3722eb30c63ac3ea7969b000f2bcad6d0c4cbe2b9"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.2/devlanes-0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c57a80a56a1e73ca6b92daed8a86d8a4ba2c9cfc78df011ee416afcaf6d7b32"
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
