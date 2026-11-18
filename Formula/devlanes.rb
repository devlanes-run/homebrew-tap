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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.2/devlanes-0.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "480a7173fa1c6b29279a47c6a9336723b5ec036821e4acf571452471961b7817"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.2/devlanes-0.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "72b57ab558e1ae7922ab3dedd93b6a7c0dd1a74a479509d7ecf0e407bf984c70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.2/devlanes-0.14.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d65b3b4f143472c7c257eaad48bf08566b29ebf86aa3bd86bfc795c6e380338"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.14.2/devlanes-0.14.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3935bca26bba09a3d0c1f3eb5fb3fccc166c8a8d656e2d21a9da943d6915ffd"
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
