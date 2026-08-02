class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.24/ara-so-cli-darwin-arm64-0.2.24.tgz"
      sha256 "e193e70f6f4b5d140b23f665e4af75d1f483ad834a1fe3b8bed4a4ca19c902ec"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.24/ara-so-cli-darwin-x64-0.2.24.tgz"
      sha256 "72fc7b1191d23cdeb94b736a2f6f298bca59728c8f4da23614391baec1c08e02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.24/ara-so-cli-linux-arm64-0.2.24.tgz"
      sha256 "785fce599770183bf5bf7b488d829c64c539a3493091b356c915ca1dbe615b73"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.24/ara-so-cli-linux-x64-0.2.24.tgz"
      sha256 "351d89056566db75aeeb104b9dd4ead668d001779686db882932c7a631e2c9c5"
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
