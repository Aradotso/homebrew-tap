class Ara < Formula
  desc "Device worker for Ara"
  homepage "https://ara.so"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.57/ara-so-cli-darwin-arm64-0.2.57.tgz"
      sha256 "16ccf2e472e2e6582207d4f0e16840583edeb1c0c91ca932d2e2975e3444b90e"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.57/ara-so-cli-darwin-x64-0.2.57.tgz"
      sha256 "20cb7412da004487f42f6d1446f6bc4557c4459c9c0cb8df3bbd25807d09527a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.57/ara-so-cli-linux-arm64-0.2.57.tgz"
      sha256 "9987b8b4bcc08c6a46135aa200269abf3d27486ec9c33948a7bc67e7001fa7c8"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.57/ara-so-cli-linux-x64-0.2.57.tgz"
      sha256 "02a86a04dd5fe4082981486e35b3a4f546aeb8dd62c72abe3b248c7ff66744d2"
    end
  end

  def install
    if OS.mac?
      libexec.install "package/bin/ara", "package/bin/libara_device_keychain.dylib", "package/bin/Ara.app"
      bin.install_symlink libexec/"ara"
    else
      bin.install "package/bin/ara"
    end
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
