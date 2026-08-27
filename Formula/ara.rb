class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.55"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.55/ara-so-cli-darwin-arm64-0.2.55.tgz"
      sha256 "5e7558e05f2a94fb56047d95c685804827bf8bc69631528f680fa04890198622"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.55/ara-so-cli-darwin-x64-0.2.55.tgz"
      sha256 "37417c07ff4e20e02d0e069fe1ed9b8ea34b05b878f24679335bd31a003af206"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.55/ara-so-cli-linux-arm64-0.2.55.tgz"
      sha256 "f168817844107eef669de4d30b6e3d61d05ce8e10cd66e327c62842c3ee77b68"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.55/ara-so-cli-linux-x64-0.2.55.tgz"
      sha256 "efdc7a02ec3012e2c9c44676861fe679edc457bb59928dc089b9668f91db5afd"
    end
  end

  def install
    if OS.mac?
      libexec.install "package/bin/ara", "package/bin/libara_device_keychain.dylib", "package/bin/Ara.app"
      bin.install_symlink libexec/"ara"
    else
      bin.install "package/bin/ara"
    end
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ara --version").strip
  end
end
