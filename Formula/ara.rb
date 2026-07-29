class Ara < Formula
  desc "Ara terminal workspace"
  homepage "https://ara.so"
  version "0.2.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.10/ara-so-cli-darwin-arm64-0.2.10.tgz"
      sha256 "d8d5c08efae86d894320c5d633a88e0f2a02e854ddbfbd0a2619ee87cc40a2f2"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.10/ara-so-cli-darwin-x64-0.2.10.tgz"
      sha256 "cd090188e977b1c42bea6ef2c2f1f7c7ac6fa6fc880c872afc774fd2e345bbc3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.10/ara-so-cli-linux-arm64-0.2.10.tgz"
      sha256 "efaddd67a155434c5c28cea4d4b999aefd27933ff28bcb76dfd9300144b78c56"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.10/ara-so-cli-linux-x64-0.2.10.tgz"
      sha256 "148e65d66d0deef9aef3cf02a1eb6228a734de52c19ffba99505cee927edfdb8"
    end
  end

  def install
    bin.install "package/bin/ara"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
