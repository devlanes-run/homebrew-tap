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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.3.0/devlanes-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "c61c69f813ed0e6e7670f5101deb9a0cce6be47eb075e911391a051ec6628f22"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.3.0/devlanes-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "4fd7e229e3da4f29c79980ce93171bb1409224f47032c10bb4ede5877dd84764"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.3.0/devlanes-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bec006a4d916efcb0bb6aa584a1cadc0489e35766ffe3c681c3830558c71cdd"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.3.0/devlanes-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9eb595e4b68b75e387df132fc51f79ba0fdc4bffe978c06f8fbc7a7746e29f9"
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
