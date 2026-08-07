class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.31/ara-so-cli-darwin-arm64-0.2.31.tgz"
      sha256 "d627e523abef6e016b577bdb0965af54586518294bf6a0eec954442d191a172a"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.31/ara-so-cli-darwin-x64-0.2.31.tgz"
      sha256 "080904e3c0591313a1488c7ff65cfe55fac455c16b09e33a02ba5812545c8625"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.31/ara-so-cli-linux-arm64-0.2.31.tgz"
      sha256 "9ba82d683e645a05ef58d94f0f34cdfdbf794da8071443dc9574736a9d2e3363"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.31/ara-so-cli-linux-x64-0.2.31.tgz"
      sha256 "3804b694ef3684556d5efa23dcdcc98fc37867cbae17f9ebbe484d5cdf1d5493"
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
