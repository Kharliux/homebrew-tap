class Autokbisw < Formula
  desc "Automatic keyboard input source switching for macOS"
  homepage "https://github.com/Kharliux/autokbisw"
  url "https://github.com/Kharliux/autokbisw/archive/refs/tags/v2.1.0-rc1.tar.gz"
  version "2.1.0-rc1"
  sha256 "e389064393eb8e6d8a5603f28680476ded9f20245fe9117cb4003fb83b0c2a8e"
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
