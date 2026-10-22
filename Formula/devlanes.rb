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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.2.0/devlanes-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "0fab8d15e147c6cbb78eff45f052fe2126b77663b2348ecc5503f3617ab41d32"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.2.0/devlanes-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "01872c2673ce0cda35b0b07d8183f1b2fd26dff6d9ac09034380f6f70e742471"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.2.0/devlanes-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34693eab8a4126d0721d9f4313c8a2928c71f157e39ff439bc36574118d77cc3"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.2.0/devlanes-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f58fc4d1dfc9386eb3e7611e49ee063b50b558c42abbc4f12a0a8daadcf0cf4"
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
