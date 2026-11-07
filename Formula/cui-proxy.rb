class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.2.0/cui-proxy_0.2.0_darwin_arm64.tar.gz"
      sha256 "cb55f89275f6591b7734f7bf25ea7ed6e6a44d2abe9c5b0ce002866424c1d909"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.2.0/cui-proxy_0.2.0_darwin_amd64.tar.gz"
      sha256 "f61f4c4999194e8aba27395bd57b9a3d8f6c2827bad2896cfdaba87a71771f39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.2.0/cui-proxy_0.2.0_linux_arm64.tar.gz"
      sha256 "f7015296a5daa644e6297a7727e18b1ef0852bcbdeb0b1c9a24c71618976be68"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.2.0/cui-proxy_0.2.0_linux_amd64.tar.gz"
      sha256 "dbe21eab1a1473812f8c04b6522873298b42b2bc9c66a45d4342bc5bd1e0865a"
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
