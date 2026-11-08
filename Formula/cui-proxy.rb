class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.4.0/cui-proxy_0.4.0_darwin_arm64.tar.gz"
      sha256 "0e92e6cd108dc297dd28669eb99fcb9bf7e49a33a18ef65cd021c4b891104a13"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.4.0/cui-proxy_0.4.0_darwin_amd64.tar.gz"
      sha256 "3e56a2354d71bc95c040fca5baeb8de6382d8a4d95cc0977c678a5cb5b2867d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.4.0/cui-proxy_0.4.0_linux_arm64.tar.gz"
      sha256 "fdc9bb0a15160227a8b009c2b7ed4e84770f732699e734bf34626072df6179f3"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.4.0/cui-proxy_0.4.0_linux_amd64.tar.gz"
      sha256 "4c1c13b678d3443fdf6556c227c188f040df3d5658ab1411348dab98e9e14040"
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
