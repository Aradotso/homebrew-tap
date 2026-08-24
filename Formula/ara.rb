class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.50"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.50/ara-so-cli-darwin-arm64-0.2.50.tgz"
      sha256 "84452bff1f2a1e07a56ee9b976bb0c469462496f1bf063624fc2d0597bd87a0c"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.50/ara-so-cli-darwin-x64-0.2.50.tgz"
      sha256 "5f21e1d03ccf1be2f5c56918e7adf4547191fdff6a2ac4f66a922ba47d09e19e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.50/ara-so-cli-linux-arm64-0.2.50.tgz"
      sha256 "e823ca821607783e386c12110346b2c1cea85901a693d83e787adf15cbdf44e6"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.50/ara-so-cli-linux-x64-0.2.50.tgz"
      sha256 "cd1eb46fd27dda07d73277aa449f4df21825edc0f3b32e0dbf9c80044c165351"
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
