class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.27/ara-so-cli-darwin-arm64-0.2.27.tgz"
      sha256 "9084f36181c0b54a4e3b4e1e8540d39962bfab3fa35b55f907f8a38f5375cb23"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.27/ara-so-cli-darwin-x64-0.2.27.tgz"
      sha256 "d559ffadc9ef48e72f087e55c90e0ce7f27361acfcb3357a6c8c6df8ee2bb226"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.27/ara-so-cli-linux-arm64-0.2.27.tgz"
      sha256 "186ba7597962e7ee5042bfc40d41a481b3e12cc85c577ab5cf847b00ee004961"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.27/ara-so-cli-linux-x64-0.2.27.tgz"
      sha256 "909a6e144ba2db792f8b39eb9136425a2ebf4607fc0af3499b7fabd172e5f4d2"
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
