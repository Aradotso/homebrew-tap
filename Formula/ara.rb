class Ara < Formula
  desc "Ara terminal workspace"
  homepage "https://ara.so"
  version "0.2.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.14/ara-so-cli-darwin-arm64-0.2.14.tgz"
      sha256 "a53d581e3812e13aac16c825ac511df21e356e33c5e8e9c2c897c468de8d5afe"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.14/ara-so-cli-darwin-x64-0.2.14.tgz"
      sha256 "54224f3a820cdded7f113b67973a3d69000ce7134fcb0a20d288083938a5f137"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.14/ara-so-cli-linux-arm64-0.2.14.tgz"
      sha256 "d6fa2bbdb433835468cf57a63adad047110d8a7fcb142a2db61ec2bca560aed4"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.14/ara-so-cli-linux-x64-0.2.14.tgz"
      sha256 "27ee4112a4cabb5c69c7bf9b22eaba798301733e0384de3b210767ac45825c4a"
    end
  end

  def install
    bin.install "package/bin/ara"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
