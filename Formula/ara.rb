class Ara < Formula
  desc "Ara terminal workspace"
  homepage "https://ara.so"
  version "0.2.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.8/ara-so-cli-darwin-arm64-0.2.8.tgz"
      sha256 "2540877112803c99fc9557f5a4d7b457a9317786b6dba4999c1bdf1bbb8b26c5"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.8/ara-so-cli-darwin-x64-0.2.8.tgz"
      sha256 "234d4da64b25247a0b548b3035dfc494894c44c219c98d585415d913f77e7386"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.8/ara-so-cli-linux-arm64-0.2.8.tgz"
      sha256 "67115c77ad7898521af692a56de67740194ca2eb2634e6029deb05fe2b8c9ae5"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.8/ara-so-cli-linux-x64-0.2.8.tgz"
      sha256 "971189fd5f34e17e99f3e00f1eb8b6958e6c57a83f4b59a29fa46189ed55e235"
    end
  end

  def install
    bin.install "package/bin/ara"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
