cask "claudine" do
  name "claudine"
  desc "Unlock your Claude Pro/Max subscription in any tool or library."
  homepage "https://github.com/florianilch/claudine-proxy"
  version "0.5.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "claudine"

  on_macos do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.5.0/claudine_#{version}_darwin_amd64.tar.gz"
      sha256 "8fc1911208f6b6b14f005a55c1dd3979ff6c17dae86c08d8bb475c685d15acee"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.5.0/claudine_#{version}_darwin_arm64.tar.gz"
      sha256 "0afde539f24109a2dfb41ef676bda4cad1c798cbae079fbecab0dcc25f22d6d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.5.0/claudine_#{version}_linux_amd64.tar.gz"
      sha256 "bdc3755135b8e4d1bf117476813d348423906c56a951893a1672ac3b6d4870dd"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.5.0/claudine_#{version}_linux_arm64.tar.gz"
      sha256 "74953a96c97db14672f51f3d6116b770ff3f47fbe7d97667b9e56809b71c3d54"
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
