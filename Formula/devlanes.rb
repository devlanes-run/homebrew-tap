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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.15.0/devlanes-0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "d336ab57d39e308081469e8788955bbc1ddbf6cedf1c716ef739e5f507b8aa69"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.15.0/devlanes-0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "365471c001ea8ada6d959a86e51608cf0c4d79989021560aa3f316988c18fb48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.15.0/devlanes-0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9cabad0f401acf8e4cf2b5b8bd53c22e10ec17fe666c2e421a958a8418a0ca1"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.15.0/devlanes-0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b94557afb9995652d1d4611ff22e61fe7ccb0514a0f9905c7b73213392e43748"
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
