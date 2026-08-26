class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.53"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.53/ara-so-cli-darwin-arm64-0.2.53.tgz"
      sha256 "6103bebc835758dd319dcc883e4c4892950c4246993283bb1f2176062404dd4c"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.53/ara-so-cli-darwin-x64-0.2.53.tgz"
      sha256 "5d11fbc25f64639eb7c31c969241420d9d46dd65309440ca13bdbfd7f63d0546"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.53/ara-so-cli-linux-arm64-0.2.53.tgz"
      sha256 "101dec14cffd5299a384947f6c06649102eaf1856c781132401de0e606f03226"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.53/ara-so-cli-linux-x64-0.2.53.tgz"
      sha256 "148eab2e46cde0d94ec3666ac4cd2e05cf54f4aa7a09659248159a68a425aed5"
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
