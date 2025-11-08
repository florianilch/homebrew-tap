cask "claudine" do
  name "claudine"
  desc "Unlock your Claude Pro/Max subscription in any tool or library."
  homepage "https://github.com/florianilch/claudine-proxy"
  version "0.2.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "claudine"

  on_macos do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.2.0/claudine_#{version}_darwin_amd64.tar.gz"
      sha256 "186a913650ea206401426cd9af091e60b37b7cf9ceea8c5660b4f21f7b1fecbe"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.2.0/claudine_#{version}_darwin_arm64.tar.gz"
      sha256 "5ee3f30fb1ba016f7181114f9012d1276edf505491bc674fc52d332c8aab75b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.2.0/claudine_#{version}_linux_amd64.tar.gz"
      sha256 "ac151a0e86cafa9d162e1fe0bc3daeefba281ce26f908754cc442692c88e258b"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.2.0/claudine_#{version}_linux_arm64.tar.gz"
      sha256 "cc4785b7f24db420fe3d22d9a0d09ac33282e1ca8557204ed2aa6382b3a45eaa"
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
