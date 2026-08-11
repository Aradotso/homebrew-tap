class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.39/ara-so-cli-darwin-arm64-0.2.39.tgz"
      sha256 "b08d95448e84cfa4206b585dde9fce53682b931935134ff2f624dd7e106bbfc4"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.39/ara-so-cli-darwin-x64-0.2.39.tgz"
      sha256 "fe051774d5c30019ecebb7456a503ed90635f58251e574290988598691af15cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.39/ara-so-cli-linux-arm64-0.2.39.tgz"
      sha256 "290be8442a0853e7acc5cb094c489b2860851c79312dcb13372012b70614e153"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.39/ara-so-cli-linux-x64-0.2.39.tgz"
      sha256 "03b8393fcc9c1ee3a3c506227a7399b13264e24ac7dc87101bfadc0c399e82a5"
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
