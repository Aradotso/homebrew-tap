class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.34/ara-so-cli-darwin-arm64-0.2.34.tgz"
      sha256 "3bb01e188d50892050858919ba06591e4695bd5687550d69779897b9e6f56e40"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.34/ara-so-cli-darwin-x64-0.2.34.tgz"
      sha256 "bc67301ef46db8790ad3b855e9ea2d35c929a1762629e4c08e072f24a2aa6746"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.34/ara-so-cli-linux-arm64-0.2.34.tgz"
      sha256 "9b1768068d6695677a8bf00330ed7ec7993861b91f434276f405eb457043cda5"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.34/ara-so-cli-linux-x64-0.2.34.tgz"
      sha256 "29734107e38487493dbf65d0d97695fbec63b8d7c1d8297c285003d5ee28d835"
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
