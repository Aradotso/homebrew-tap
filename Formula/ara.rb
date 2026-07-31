class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.22/ara-so-cli-darwin-arm64-0.2.22.tgz"
      sha256 "ff05ccc88907f5110a1d013b13c9b50110d7261c707d42ccca83f8297fd92243"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.22/ara-so-cli-darwin-x64-0.2.22.tgz"
      sha256 "1a4bf57eea676c99ad17e09b8d55bf6456982637bb20b619369bc0df2598aa3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.22/ara-so-cli-linux-arm64-0.2.22.tgz"
      sha256 "43e7c3a6d72d84f6ed810c1239b8ddfe2ce6c636c596c5e0eac9f7ac5958a134"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.22/ara-so-cli-linux-x64-0.2.22.tgz"
      sha256 "7eceda92b830f3dee32fb22de08582619031d404c03ba59e5b0a977a8c2d95a0"
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
