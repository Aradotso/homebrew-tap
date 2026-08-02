class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.25/ara-so-cli-darwin-arm64-0.2.25.tgz"
      sha256 "b2c4f9f45d2c71edac8cc5363a74ccc5a23d622693dabd22fdfdd6ddc779a78f"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.25/ara-so-cli-darwin-x64-0.2.25.tgz"
      sha256 "ea6c660e27e6e965b99c52407fedc4fe2e37ea27c879971c087bde3ab61c9fe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.25/ara-so-cli-linux-arm64-0.2.25.tgz"
      sha256 "d7f8942b766f61c3f5159cfbe19a1fbce6d080a60467c7c0fb519ac21cc358a6"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.25/ara-so-cli-linux-x64-0.2.25.tgz"
      sha256 "43b7d60a795c1589cf8ff787e22453c26e1dcb7ecb365f4248a681eb13f52d57"
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
