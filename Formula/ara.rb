class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.23/ara-so-cli-darwin-arm64-0.2.23.tgz"
      sha256 "353f03ce5e49ce6c6b5ec9c3c3435ee99d6ad2dee5d4d144b5370fa8f5f588c3"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.23/ara-so-cli-darwin-x64-0.2.23.tgz"
      sha256 "c03dc71492768d438bc6e15d9b1341ee24b919d0e366816cc69c10cc6f6178c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.23/ara-so-cli-linux-arm64-0.2.23.tgz"
      sha256 "2f83354fbaae56564a63f58d3405027095452c988da3064b63014d573e2ba639"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.23/ara-so-cli-linux-x64-0.2.23.tgz"
      sha256 "1ca1e056d771dc9f5387aa8cfba3efb1967eaaeb66f747e6bc8136884dbc13f2"
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
