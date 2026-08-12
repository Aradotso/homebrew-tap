class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.40"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.40/ara-so-cli-darwin-arm64-0.2.40.tgz"
      sha256 "428ca3397b1aa45eea1884dd8895a2264784f02ed0c777f47c4354ec9d8c7b28"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.40/ara-so-cli-darwin-x64-0.2.40.tgz"
      sha256 "6181646b97af600624e415df5c0f08f67e15080592265ad9faf5c591f51b67b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.40/ara-so-cli-linux-arm64-0.2.40.tgz"
      sha256 "f7f58482c8b5a6a0b4ac725a7d9341d28b762d86c0f90c4821a49050a5af5a9b"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.40/ara-so-cli-linux-x64-0.2.40.tgz"
      sha256 "cfa64f57d3871d8cd0138736c565009b8e2692636dd1bb40306ac2775923f20b"
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
