class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.49"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.49/ara-so-cli-darwin-arm64-0.2.49.tgz"
      sha256 "bf1583c474ad681476fa0c92a8f23af4a0aa45122f61646fc1d348753df843db"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.49/ara-so-cli-darwin-x64-0.2.49.tgz"
      sha256 "ffbe884b5e1de64b395c213e37cebc676d0899f7e3e64fb91545f2cb4912df5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.49/ara-so-cli-linux-arm64-0.2.49.tgz"
      sha256 "4b5ba67a32ca19a50fbb6efab18f4765b3829e55b0f33d0d356e2f570524b4df"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.49/ara-so-cli-linux-x64-0.2.49.tgz"
      sha256 "e72be991c9312af6c3a93bff8b3a4d0aa99b1676f38f8362b934a8114cbb7022"
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
