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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.3/devlanes-0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "02ae59e21eed1c0a8b7d92e93c2f5e2f0c75eec55f158c8fdd99afc725e9657a"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.3/devlanes-0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "232fff8c1082a8b8d452570142cf14e08793adf3ad04ba190dc8ab13b075303d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.3/devlanes-0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5fcaae24c05bb3d8935601afeb3f982fa953861aaba85c3feb19d06ffdaac96"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.4.3/devlanes-0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b17003da4ae416fa1dff1a139d9359b42e206b1aad910f577b28e1ec11bb17e"
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
