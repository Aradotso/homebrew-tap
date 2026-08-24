class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.51"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.51/ara-so-cli-darwin-arm64-0.2.51.tgz"
      sha256 "261abd939e14e317d113e1f1aa9fc9e316d225fb14ad47fc769574cb1bf9f7fb"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.51/ara-so-cli-darwin-x64-0.2.51.tgz"
      sha256 "c486e69df32e980021e312278366c0fbb3fce779aa29fd4f9cc695591714b09a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.51/ara-so-cli-linux-arm64-0.2.51.tgz"
      sha256 "08804763d5c2ba865ff8e822c3c020b058b27c2932a17862a2a1923e3fa0cfdc"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.51/ara-so-cli-linux-x64-0.2.51.tgz"
      sha256 "f1bf221a8801a78b2b953229a9c3e1d18cd0a281a1783a28270e879ee670c9e7"
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
