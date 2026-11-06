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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.3/devlanes-0.11.3-aarch64-apple-darwin.tar.gz"
      sha256 "888e4b04f46887ae73fb923f35742c80d4a750235e034581df904c198a3f84f7"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.3/devlanes-0.11.3-x86_64-apple-darwin.tar.gz"
      sha256 "ba6ef69a22897105e0a498be6d909d7567fcb1d774613d8580422d1c6f160f74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.3/devlanes-0.11.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d4209bcd6d88cf8f7e855e2e0d09ae6b52bde0362702d53f04d1ed324c3960a"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.11.3/devlanes-0.11.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "781013ec55aa6f5422da734caa1237f7cc81b15cec980a0a38e7ef89cb1ded38"
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
