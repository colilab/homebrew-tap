cask "hostflow" do
  version "1.0.8"
  sha256 "fc7b7132074756917d6a0fd7f59046197827e66102ced61a2db36987e9443cd7"

  url "https://github.com/colilab/hosts-flow/releases/download/#{version}/HostFlow-#{version}.dmg"
  name "Host Flow"
  desc "Manage /etc/hosts entries via toggleable profiles"
  homepage "https://github.com/colilab/hosts-flow"

  # Sparkle drives in-app updates; Homebrew should not try to track the version.
  auto_updates true
  depends_on macos: :sonoma

  app "HostFlow.app"

  # The app is ad-hoc signed (no Developer ID, by design — see
  # github.com/colilab/hosts-flow/blob/main/docs/release.md §5.2), so spctl
  # rejects it and Gatekeeper would block first launch despite brew's
  # quarantine-approval bit. Strip the quarantine xattr explicitly.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/HostFlow.app"]
  end

  uninstall launchctl: "com.colilab.hostflow.helper",
            quit:      "com.colilab.hostflow",
            delete:    "/Library/LaunchDaemons/com.colilab.hostflow.helper.plist"

  zap trash: [
    "~/Library/Application Support/HostFlow",
    "~/Library/Caches/com.colilab.hostflow",
    "~/Library/HTTPStorages/com.colilab.hostflow",
    "~/Library/Preferences/com.colilab.hostflow.plist",
    "~/Library/Saved Application State/com.colilab.hostflow.savedState",
  ]
end
