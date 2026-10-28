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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.0/devlanes-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "187237ddb3a6aac0c982ff6adabca4282c3b350a7925771603d420e873b83ddf"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.0/devlanes-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "c5a7c4e5bbbec827c8ba0e5f2380d7998d52cbf8382b10cbdc41c208040c6740"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.0/devlanes-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc96de29d934f495a0cae68431268df637f4602265d0ccac49ca19a7c24ade73"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.7.0/devlanes-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e14bffbd7eabd8ab42d9dfc1e9b9380cb205db6810d6ab22f240906bf568e4d6"
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
