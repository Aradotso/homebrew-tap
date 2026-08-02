class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.26/ara-so-cli-darwin-arm64-0.2.26.tgz"
      sha256 "195d4119921d8416429f73e83e3f23cb66b296cc38091cbf5671ed27f8f2a2d6"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.26/ara-so-cli-darwin-x64-0.2.26.tgz"
      sha256 "30052543bfa7dcf0670d41e5bffaf95f5499aebe994f06d2a26ebc2aed04a0b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.26/ara-so-cli-linux-arm64-0.2.26.tgz"
      sha256 "6017644d201dbe6cc3c1477e9199273628ca7e4e6fa5d982abe4b92bf104ad5c"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.26/ara-so-cli-linux-x64-0.2.26.tgz"
      sha256 "bfba9cea0ed10135d271d9aa5a2d0b56a578ba737338776c6671af41d8e162ef"
    end
  end

  def install
    if OS.mac?
      libexec.install "package/bin/ara", "package/bin/libara_device_keychain.dylib"
      bin.install_symlink libexec/"ara"
    else
      bin.install "package/bin/ara"
    end
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
