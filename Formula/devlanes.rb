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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.5.0/devlanes-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "643e90ff38bff695e01bc232b115822fa97587f5ffa7e38cd45fab16c3cce611"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.5.0/devlanes-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "cd20fdc4e4842742823288f6710238250245092f8e5a0ec8a62c94bb991ea8fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.5.0/devlanes-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed82c222b0165ffb5a32c5249aa1a9961a1af75d021cd1ad44fa2129196d1c6a"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.5.0/devlanes-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17b109edc94b39e750f1e29994794187667d81275948c57c577b73c8d988a21d"
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
