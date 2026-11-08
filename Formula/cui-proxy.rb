class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.0/cui-proxy_0.5.0_darwin_arm64.tar.gz"
      sha256 "72d13e8f8b5f604c5b400b523121b37f9c11b648d57d3dccbf298e5a312576fc"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.0/cui-proxy_0.5.0_darwin_amd64.tar.gz"
      sha256 "e411aadd882cbc95d784c3e558e59067ad4a4c5edb8d18878b35a96b12b20490"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.0/cui-proxy_0.5.0_linux_arm64.tar.gz"
      sha256 "0f00eb3d37a99bb9644a3efbaa447d90789e6a3a4cffcb436e6481a0b8b83a98"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.0/cui-proxy_0.5.0_linux_amd64.tar.gz"
      sha256 "475269b9bdbec34c70bc4ecccf10851a592578db3746fcf6fb74127e432b4372"
    end
  end

  def install
    bin.install "cui-proxy"
    pkgshare.install "examples"
  end

  def caveats
    <<~EOS
      Create a starter config and dictionary, then start the proxy:
        cui-proxy init
        cui-proxy serve -config ~/.config/cui-proxy/config.yaml

      On macOS, to run it in the background with a menu-bar icon:
        cui-proxy menubar install

      cui-proxy reduces risk; it is not a compliance control. Read
      https://github.com/rozdolsky33/cui-proxy#readme before use.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cui-proxy version")
    system bin/"cui-proxy", "check-config", "-config", pkgshare/"examples/config.yaml"
  end
end
