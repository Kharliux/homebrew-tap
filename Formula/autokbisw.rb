class Autokbisw < Formula
  desc "Automatic keyboard input source switching for macOS"
  homepage "https://github.com/Kharliux/autokbisw"
  url "https://github.com/Kharliux/autokbisw/archive/refs/tags/v2.1.0-rc2.tar.gz"
  version "2.1.0-rc2"
  sha256 "1247eff998d9d8cdd9d7c86fe3e9550b67ebf0c836841e59d405c5b4718e3305"
  license "Apache-2.0"

  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"

    bin.install ".build/release/autokbisw"
  end

  service do
    run [opt_bin/"autokbisw"]
    keep_alive true
    process_type :background
    log_path var/"log/autokbisw.log"
    error_log_path var/"log/autokbisw.error.log"
  end

  test do
    system "#{bin}/autokbisw", "--help"
  end
end
