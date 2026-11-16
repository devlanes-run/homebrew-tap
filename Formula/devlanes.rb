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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.1/devlanes-0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "c1312a0bf472c1dee541c1978268c5f09a33f3a4232fb7c055db4950ca945863"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.1/devlanes-0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "727ad780b0f3e604ae602b29767f72839863be26cb1fe8c02556d628b55604ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.1/devlanes-0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7ae5b0926278370a26c7aeb52df398948eafeeb0691093baa177b6cab294953"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.13.1/devlanes-0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e63cff47d09f44bdf5ba8481f762027aa2345e76703a50d3d2570f1621c3369"
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
