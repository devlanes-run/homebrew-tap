# Placeholder until the first devlanes release. The release workflow of
# devlanes-run/devlanes replaces this file for every stable version.
class Devlanes < Formula
  desc "Development environments in Git worktree lanes"
  homepage "https://devlanes.run"
  url "https://github.com/devlanes-run/devlanes/archive/refs/heads/main.tar.gz"
  version "0.0.0"
  license "Apache-2.0"

  disable! date: "2026-10-21", because: "has no release yet"

  def install
    odie "devlanes has no release yet"
  end
end
