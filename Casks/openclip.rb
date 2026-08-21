cask "openclip" do
  version "1.0.1"
  sha256 "44cb76972567217654121ed0b55642e681ad993b6b643df98c226b2802f84e1c"

  url "https://github.com/ganeshmshetty/openclip/releases/download/v#{version}/OpenClip-v#{version}.zip"
  name "OpenClip"
  desc "Instant actions for selected text on macOS"
  homepage "https://www.getopenclip.app"

  auto_updates true
  depends_on macos: :sonoma

  app "OpenClip.app"

  zap trash: [
    "~/.openclip",
    "~/Library/Caches/com.openclip.OpenClip",
    "~/Library/Logs/OpenClip",
    "~/Library/Preferences/com.openclip.OpenClip.plist",
  ]
end
