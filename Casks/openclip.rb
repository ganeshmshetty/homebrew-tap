cask "openclip" do
  version "1.3.1"
  sha256 "5f4a5199f6f05457a5193b2f3ca4359c2601e197f6a8aee587354d8f013d7256"

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
