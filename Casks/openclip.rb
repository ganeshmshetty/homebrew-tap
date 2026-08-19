cask "openclip" do
  version "1.0.0"
  sha256 "8a16f86e9a5ea48f693e5226e639d8e0f5f3baf89365e4ec5b0741e78325a314"

  url "https://github.com/ganeshmshetty/openclip/releases/download/v#{version}/OpenClip-v#{version}.zip"
  name "OpenClip"
  desc "Instant actions for selected text on macOS"
  homepage "https://www.getopenclip.app"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "OpenClip.app"

  zap trash: [
    "~/.openclip",
    "~/Library/Caches/com.openclip.OpenClip",
    "~/Library/Logs/OpenClip",
    "~/Library/Preferences/com.openclip.OpenClip.plist",
  ]
end
