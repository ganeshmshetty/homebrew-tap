cask "openclip" do
  version "1.2.0"
  sha256 "74cf25d16d99a8985bf12ad47a127eba54bd19c1702888649ac810842a996d97"

  url "https://github.com/ganeshmshetty/openclip/releases/download/v#{version}/OpenClip-v#{version}.zip"
  name "OpenClip"
  desc "Instant actions for selected text on macOS"
  homepage "https://www.getopenclip.app/"

  auto_updates true
  depends_on macos: :sonoma

  app "OpenClip.app"

  # ad-hoc signed, no Apple Developer ID yet - strip quarantine for 0 friction
  # TODO: remove postflight after Developer ID/notarization
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenClip.app"]
  end

  zap trash: [
    "~/.openclip",
    "~/Library/Caches/com.openclip.OpenClip",
    "~/Library/Logs/OpenClip",
    "~/Library/Preferences/com.openclip.OpenClip.plist",
  ]

  caveats do
    <<~EOS
      OpenClip is ad-hoc signed (no Apple Developer ID). Gatekeeper quarantine is auto-removed
      by postflight (xattr -dr). Verify: codesign -dv /Applications/OpenClip.app
    EOS
  end
end
