cask "mirin" do
  version "0.1.1"
  sha256 :no_check # Replace with the actual SHA256 hash of the DMG file once GitHub Release builds it

  url "https://github.com/ganeshmshetty/mirin/releases/download/v#{version}/Mirin_#{version}_aarch64.dmg"
  name "Mirin"
  desc "Modern intuitive screen mirroring interface for Android (scrcpy)"
  homepage "https://github.com/ganeshmshetty/mirin"

  app "Mirin.app"

  zap trash: [
    "~/Library/Application Support/com.mirin.gui",
    "~/Library/Preferences/com.mirin.gui.plist",
    "~/Library/Saved Application State/com.mirin.gui.savedState",
  ]
end
