class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.38/ara-so-cli-darwin-arm64-0.2.38.tgz"
      sha256 "ff19c31c3b454257d1487fde4f65de3cde1aa803eea3263142f5e78066ebce08"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.38/ara-so-cli-darwin-x64-0.2.38.tgz"
      sha256 "8396691efd211d74fb77cec2c11048c1c110445559547e8e2a841b652d241f65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.38/ara-so-cli-linux-arm64-0.2.38.tgz"
      sha256 "1fafc46655e18d2b4a4123eb0fb08b3708ed51d9d361c2fb4cbc857ff1e3185e"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.38/ara-so-cli-linux-x64-0.2.38.tgz"
      sha256 "5446ac0116f82090bfd6b09100f660972c03a71a56e06a7607ad4e22426a29b5"
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
