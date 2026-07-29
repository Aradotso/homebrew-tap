cask "ara" do
  version "0.1.2"
  sha256 "aae4066876f58de077aac7fd6426b9474180c51359218bef72880a1678f65ec1"

  url "https://github.com/Aradotso/homebrew-tap/releases/download/desktop-v#{version}/Ara_#{version}_aarch64.dmg"
  name "Ara"
  desc "Cloud coding agent that works alongside your team"
  homepage "https://ara.so/"

  # Only the Apple silicon build is published so far. Without this, an Intel Mac
  # would download an arm64 app and fail at launch rather than at install.
  depends_on arch: :arm64
  depends_on :macos

  app "Ara.app"

  # The app keeps its session in a WebKit data store under its bundle id; leaving
  # it behind means a reinstall silently inherits the previous sign-in.
  zap trash: [
    "~/Library/Application Support/so.ara.desktop",
    "~/Library/Caches/so.ara.desktop",
    "~/Library/HTTPStorages/so.ara.desktop",
    "~/Library/Preferences/so.ara.desktop.plist",
    "~/Library/Saved Application State/so.ara.desktop.savedState",
    "~/Library/WebKit/so.ara.desktop",
  ]
end
