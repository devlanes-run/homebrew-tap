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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.1/devlanes-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "0c0d2369eec36856c49ca5fcd6ef7589e6c30626545c4f524f512f07cb5ab4ef"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.1/devlanes-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "b5a3600f49ed9e78a0ddd6b53e186e6533450e7151d816fb8747bde70123ba7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.1/devlanes-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10867cca9b942fa35e84731c0beac5429b259760108c8d1d925e3a619e99cb7e"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.6.1/devlanes-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac3bed2a145d9d28ab2e7376d8c0943e6d4f0cde75e2ff880a51591906e24f2c"
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
