class Autokbisw < Formula
  desc "Automatic keyboard input source switching for macOS"
  homepage "https://github.com/Kharliux/autokbisw"
  url "https://github.com/Kharliux/autokbisw/archive/refs/tags/v2.1.0-beta1.tar.gz"
  version "2.1.0-beta1"
  sha256 "112f39209ed09300c5cbd3d8dc1de283030e7808804ea49ab25e84f097fb8597"
  license "MIT"

  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"

    bin.install ".build/release/autokbisw"
  end

  test do
    system "#{bin}/autokbisw", "--help"
  end
end
