cask "openclip" do
  version "1.5.0"
  sha256 "79fd0e20fbaf0d1684b02340d9cd8203e9192d6967a65d347f24e7c230f993db"

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
