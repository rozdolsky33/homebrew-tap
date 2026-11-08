class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.3/cui-proxy_0.3.3_darwin_arm64.tar.gz"
      sha256 "67c2f43ff75e65ff7c2817d5d4b22ace04d201f90270bc7b033240d6be73af08"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.3/cui-proxy_0.3.3_darwin_amd64.tar.gz"
      sha256 "0cea94a167f693dd2b96235ab9e0f68e730060a4673a3fa8413d65d4fd168482"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.3/cui-proxy_0.3.3_linux_arm64.tar.gz"
      sha256 "730659133eb5fbc1493f57fdb5a1df82a2e57e89bebadb8287cf6fb79b9b6d8a"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.3/cui-proxy_0.3.3_linux_amd64.tar.gz"
      sha256 "fa8d1fd691244fd51903fb7cd6a599b6cf630ddcd0698789164b70e89be6e775"
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
