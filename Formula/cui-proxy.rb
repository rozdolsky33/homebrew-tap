class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.1/cui-proxy_0.1.1_darwin_arm64.tar.gz"
      sha256 "555049d1115311a5d79fe6201684c64e05a5897ce56383d2e66eaeaf04701b28"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.1/cui-proxy_0.1.1_darwin_amd64.tar.gz"
      sha256 "36621f9040a01e960021970648f8dd52f2e7a812970558f2ec7341eeee859b0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.1/cui-proxy_0.1.1_linux_arm64.tar.gz"
      sha256 "ac1d8a95bc40187ee016b65826ee259541d68ce874247545a27cf85d3e69c224"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.1/cui-proxy_0.1.1_linux_amd64.tar.gz"
      sha256 "7276bf6e86b5c6fa7189b350fc2f21ef23dc6f74d7317937e65a2d99970a09de"
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
