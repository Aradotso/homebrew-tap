class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.36/ara-so-cli-darwin-arm64-0.2.36.tgz"
      sha256 "4a90370c0ca1fa89194df43366a9df7835b843a8d2aa78976b5a37ca322d0a30"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.36/ara-so-cli-darwin-x64-0.2.36.tgz"
      sha256 "5ab34d9e5464fc1bbfcb6876072f743cad589e1de7b8e1d831d4ed04e67ccfa7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.36/ara-so-cli-linux-arm64-0.2.36.tgz"
      sha256 "caeb55132fc1b8ef9dbcced89761b2073c871ae5d74cef1bf66d651a97a9a777"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.36/ara-so-cli-linux-x64-0.2.36.tgz"
      sha256 "630ef9cd5dacc181f9852a54d52a0d6c98fe6c586fee50327df2a045fbaad9e6"
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
