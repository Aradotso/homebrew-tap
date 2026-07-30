class Ara < Formula
  desc "Ara terminal workspace"
  homepage "https://ara.so"
  version "0.2.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.13/ara-so-cli-darwin-arm64-0.2.13.tgz"
      sha256 "afe71fd0e01219dd56279422211fd4ce822af96826e3acada0fb7cf4dbb0f629"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.13/ara-so-cli-darwin-x64-0.2.13.tgz"
      sha256 "8b8fd6f2306b515e42f7d15251ed25972ac278f3fb569449e4cbefbdcf097a2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.13/ara-so-cli-linux-arm64-0.2.13.tgz"
      sha256 "ec87fed0535a4e3f6411b7df5f7a0f43ec9c1d4bcc0f7ee0b6cfca149f5a2758"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.13/ara-so-cli-linux-x64-0.2.13.tgz"
      sha256 "a6a83c414781442e142b4565465852a012ec267212af8753c8c86ab3109d4a53"
    end
  end

  def install
    bin.install "package/bin/ara"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
