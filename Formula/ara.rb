class Ara < Formula
  desc "Ara terminal workspace"
  homepage "https://ara.so"
  version "0.2.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.6/ara-so-cli-darwin-arm64-0.2.6.tgz"
      sha256 "06303abf9e62394210623e98373488be296bb78f7bf9c435bc8f30af41357cd3"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.6/ara-so-cli-darwin-x64-0.2.6.tgz"
      sha256 "4b71d21290ae424efc8bc4b7c62be3b9a6a8e650b701ac2c42861aee9dd43a86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.6/ara-so-cli-linux-arm64-0.2.6.tgz"
      sha256 "f2ec5869e32cbafdd6ff10e21d19d899b9a81a2ecf19255e5ff40f8e967b00e5"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.6/ara-so-cli-linux-x64-0.2.6.tgz"
      sha256 "ed112e530a86ee2fcc30f02aa5c0fa9e08596b4d4bf78a5282e0b87943f83541"
    end
  end

  def install
    bin.install "package/bin/ara"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
