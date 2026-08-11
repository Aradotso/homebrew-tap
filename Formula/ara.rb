class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.33/ara-so-cli-darwin-arm64-0.2.33.tgz"
      sha256 "a1352fa36535e99a7beecc2611c58e298a8facf04a708f708062224d87f01be4"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.33/ara-so-cli-darwin-x64-0.2.33.tgz"
      sha256 "08350598d7599490ad850989bbabf7ad70724357ffd1e88b18e08cb338919d5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.33/ara-so-cli-linux-arm64-0.2.33.tgz"
      sha256 "051730cc43466995edc999eabbcf2c5f1ffac2f2a534e0bb05fe86fc9b737efb"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.33/ara-so-cli-linux-x64-0.2.33.tgz"
      sha256 "e9fbca2e364bfc0bb3203c87587c254ad7ba64d133ab1209962dad3bae5c347a"
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
