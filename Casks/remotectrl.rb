cask "remotectrl" do
  version "0.0.5"

  if Hardware::CPU.intel?
    sha256 :no_check
    url "https://github.com/ganeshmshetty/RemCtrl/releases/download/v#{version}/RemoteCtrl-#{version}.dmg"
  else
    sha256 :no_check
    url "https://github.com/ganeshmshetty/RemCtrl/releases/download/v#{version}/RemoteCtrl-#{version}-arm64.dmg"
  end

  name "RemoteCtrl"
  desc "Remote browser control desktop app"
  homepage "https://github.com/ganeshmshetty/RemCtrl"

  app "RemoteCtrl.app"

  zap trash: [
    "~/Library/Application Support/RemoteCtrl",
    "~/Library/Application Support/com.RemoteCtrl.app",
    "~/Library/Preferences/com.RemoteCtrl.app.plist",
    "~/Library/Saved Application State/com.RemoteCtrl.app.savedState",
    "~/.config/RemoteCtrl"
  ]
end
