class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.37/ara-so-cli-darwin-arm64-0.2.37.tgz"
      sha256 "d7c16525294588b5e5862f7260f8538e1e5e8b63ea994d435ba14f0e836beb07"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.37/ara-so-cli-darwin-x64-0.2.37.tgz"
      sha256 "a044ae8f2b7b8888674a8a09f1f401fca5a0aa9d7f5596c8112eb48ff006c8b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.37/ara-so-cli-linux-arm64-0.2.37.tgz"
      sha256 "6fd71d05d1c9e892f37988edbd45716354f544931f71b276b5169db70ab31f2f"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.37/ara-so-cli-linux-x64-0.2.37.tgz"
      sha256 "79f5a57e0c75c38027c35e8fd316898f76784783ebc7bfb74691a79ed5ac3065"
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
