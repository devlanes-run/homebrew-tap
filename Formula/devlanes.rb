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
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.10.0/devlanes-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "633189f2b71dd7dbb0126fe8a7e4e836894b98bedca9b29c83eee2dff3e4539c"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.10.0/devlanes-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "93e56010d14888dd231af012dd804c0878ecde2b22b53123c632dfd2c35878ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.10.0/devlanes-0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff7bd967ee3cdbdb84a126d282fa655037c15bd4d3d7bdda0ffcdb823a7c92b2"
    end
    on_intel do
      url "https://github.com/devlanes-run/devlanes/releases/download/v0.10.0/devlanes-0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1967ce8cac6d56b3893e7de57cc6ffe9107e171c60996e80678750cef9b6875"
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
