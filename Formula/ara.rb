class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.54"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.54/ara-so-cli-darwin-arm64-0.2.54.tgz"
      sha256 "f384b1d1bb0014549c8e60ef3b3a6ef8d347f151f21fdfeb0b2299d32d992ba6"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.54/ara-so-cli-darwin-x64-0.2.54.tgz"
      sha256 "cea707735dcaf387763ce21034a5c6672db3537c15ba2fc2f315cff7c3fd220f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.54/ara-so-cli-linux-arm64-0.2.54.tgz"
      sha256 "566875f2e541453597748693a031e0db0e5e1ec7030280e66222fe809419cb02"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.54/ara-so-cli-linux-x64-0.2.54.tgz"
      sha256 "0664db3d391d91b0064ac652d21fb6eaf9953134b87784642810dc4d876e3d4e"
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
