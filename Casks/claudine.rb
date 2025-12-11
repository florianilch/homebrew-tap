cask "claudine" do
  name "claudine"
  desc "Unlock your Claude Pro/Max subscription in any tool or library."
  homepage "https://github.com/florianilch/claudine-proxy"
  version "0.6.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "claudine"

  on_macos do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.6.0/claudine_#{version}_darwin_amd64.tar.gz"
      sha256 "933092615be99b221fce922c1e2c50314d1c4bea91d47e635695ee8a941346d0"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.6.0/claudine_#{version}_darwin_arm64.tar.gz"
      sha256 "771a1670346f155b941449a1e79a52af6c631c5f46e538841fddf188cd08f593"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.6.0/claudine_#{version}_linux_amd64.tar.gz"
      sha256 "b8120d360b7d51ea41927cbd52457997359c6a9641fef01e93772c9328388e8d"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.6.0/claudine_#{version}_linux_arm64.tar.gz"
      sha256 "19e64ce91b750aea60d8697554a6283c688ee4044ec728cc27dd450fe9e0f107"
    end
  end

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/claudine"]
    end
  end

  uninstall trash: [
      "~/.config/claudine-proxy/auth",
      "~/Library/ApplicationSupport/claudine-proxy/auth",
    ]

  zap trash: [
      "~/.config/claudine-proxy",
      "~/Library/ApplicationSupport/claudine-proxy",
    ]
end
