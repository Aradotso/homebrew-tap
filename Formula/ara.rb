class Ara < Formula
  desc "Ara Device worker"
  homepage "https://ara.so"
  version "0.2.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.29/ara-so-cli-darwin-arm64-0.2.29.tgz"
      sha256 "8a1764d2c98a07258e3c4f07c80f3c3eb1d553253c75c44875d7f2dafabd5ab6"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.29/ara-so-cli-darwin-x64-0.2.29.tgz"
      sha256 "2f581f8d461dd15e671fd7703026b4f909ec582e8cb7d8546cc026ed5ac3d7dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.29/ara-so-cli-linux-arm64-0.2.29.tgz"
      sha256 "f893017da8d98a0a51661037945933c39f23abc747146ef6e621fce9e55111bd"
    else
      url "https://github.com/Aradotso/homebrew-tap/releases/download/cli-v0.2.29/ara-so-cli-linux-x64-0.2.29.tgz"
      sha256 "bc80fd1475406940cd96ba7892b8cea24b4cec7cf09c9ac981123b11d3fcf8f4"
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
