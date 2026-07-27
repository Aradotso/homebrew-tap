class Ara < Formula
  desc "Ara terminal workspace"
  homepage "https://ara.so"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.7/ara-so-cli-darwin-arm64-0.2.7.tgz"
      sha256 "c29e585e1742715511fcabad4498220a2afae3408f344dd479db824bb62aadba"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.7/ara-so-cli-darwin-x64-0.2.7.tgz"
      sha256 "9dd583b33cfc12ab150a13a80dbea32c5cd519ec921ffe0626a8d3db6abad958"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.7/ara-so-cli-linux-arm64-0.2.7.tgz"
      sha256 "5452b0f654e9dd858a412c36b8ab05dda36cc05c0abac1524194a79d45d9cc5c"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.7/ara-so-cli-linux-x64-0.2.7.tgz"
      sha256 "e74185805f119d2abede995e990984af0a3a3bd10d688b789d36586baf379e06"
    end
  end

  def install
    bin.install "package/bin/ara"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
