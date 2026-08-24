class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.48/ara-so-cli-darwin-arm64-0.2.48.tgz"
      sha256 "545210759a1f77c9ffaa5d2c7b0b9051aa76049265090b4e7f3bd2d1c2257588"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.48/ara-so-cli-darwin-x64-0.2.48.tgz"
      sha256 "d3517aad2037d43a9f3c1ec71f9dc042d6aaf87fe6e9b2814ae203817c211436"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.48/ara-so-cli-linux-arm64-0.2.48.tgz"
      sha256 "774ca04850fb6fe3457039e7f61b2857e6e41556ba02159866afd5aa08aa41dc"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.48/ara-so-cli-linux-x64-0.2.48.tgz"
      sha256 "f0bc3dc86ee036a3b1724b592faa4614ea3ef6926d40a91738c79462b1890932"
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
