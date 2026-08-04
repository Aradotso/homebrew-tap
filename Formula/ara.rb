class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.30/ara-so-cli-darwin-arm64-0.2.30.tgz"
      sha256 "a5382574c42fde73f9265592d2581c90c09012f2a93f42aa171c734b2982cd4d"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.30/ara-so-cli-darwin-x64-0.2.30.tgz"
      sha256 "d7e322a44e8c0c80420320cb0bcbafd8571717f4009f03f400610ae0d6e3a8ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.30/ara-so-cli-linux-arm64-0.2.30.tgz"
      sha256 "e2ece7788a3c4eb71dde0f4754fd19207c21eece75f6fd6129734251d14e592e"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.30/ara-so-cli-linux-x64-0.2.30.tgz"
      sha256 "968518454625a48fb791f7bd94f4c1e077bd356601748601c561d1490efb953a"
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
