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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.3/devlanes-0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "a64c95294992a046fe0dc7a2fd8fc92ae520d9a936d988774c6e69152bdb80c7"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.3/devlanes-0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "a7d9f8627eb8d34450921f65fd1fe6463f47703ca0b1c51bb3efdef38dfd9982"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.3/devlanes-0.13.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ddb53d3f3bb1cfbb6a9fa9d0593ff67356bcf7c53c7613b6325f0d6afe163554"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.3/devlanes-0.13.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d09c6b65d9f7ba3e84ca491a080929bc9db1a5c7ad0768e3b6f4b6ccf9462f6"
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
