class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.32/ara-so-cli-darwin-arm64-0.2.32.tgz"
      sha256 "2f2adc8851d3473ad583d80ea3d5c6dafc0917a4e8c8da47a6ca8d3968adfa2a"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.32/ara-so-cli-darwin-x64-0.2.32.tgz"
      sha256 "1770304f60123ecc933122cc9c701c0dfcc4b4d7b5c7e7c8f0dc53e4a5a128be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.32/ara-so-cli-linux-arm64-0.2.32.tgz"
      sha256 "bc674b7f461eb00ffe493f1e96be1ffaa0d53e5a52194e0251751e41337d6f4d"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.32/ara-so-cli-linux-x64-0.2.32.tgz"
      sha256 "3f506d08e9b49469c8743c766ba747cb286a8ef281fae7d136ef6c964416dddf"
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
