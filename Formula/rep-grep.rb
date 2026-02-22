class RepGrep < Formula
  desc "wgrep/write-grep CLI"
  homepage "https://github.com/robenkleene/rep-grep"
  url "https://github.com/robenkleene/rep-grep/archive/refs/tags/0.0.8.tar.gz"
  sha256 "929be5ef42384b68931978056104d1be429df38dea1487987de4da9f5045565d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install Dir["target/release/build/rep-grep-*/out/rep.1"].first
  end

  test do
    assert_match "rep", shell_output("#{bin}/rep --version")
  end
end
