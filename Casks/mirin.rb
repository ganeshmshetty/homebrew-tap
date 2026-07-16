cask "mirin" do
  version "0.2.0"

  if Hardware::CPU.intel?
    sha256 :no_check
    url "https://github.com/ganeshmshetty/mirin/releases/download/v#{version}/Mirin_#{version}_x64.dmg"
  else
    sha256 :no_check
    url "https://github.com/ganeshmshetty/mirin/releases/download/v#{version}/Mirin_#{version}_aarch64.dmg"
  end

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
