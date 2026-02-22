class RenFind < Formula
  desc "Rename files from find results"
  homepage "https://github.com/robenkleene/ren-find"
  url "https://github.com/robenkleene/ren-find/archive/refs/tags/0.0.4.tar.gz"
  sha256 "9f1d7e20773985a3dbdd707a409585ea686d95949b0a02bffda2000207e21267"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install Dir["target/release/build/ren-find-*/out/ren.1"].first
  end

  test do
    assert_match "ren", shell_output("#{bin}/ren --version")
  end
end
