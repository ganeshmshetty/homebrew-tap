cask "mirin" do
  version "0.1.2"

  if Hardware::CPU.intel?
    sha256 "4bf4dfb3c61c02c0635e08b5b168d717603f751143cd315c81cff7962a076205"
    url "https://github.com/ganeshmshetty/mirin/releases/download/v#{version}/Mirin_#{version}_x64.dmg"
  else
    sha256 "f8bd2a855b7e60af0442a460c7f3a899dcce73a23a35a0ddff4e1f6152c6c3d5"
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
