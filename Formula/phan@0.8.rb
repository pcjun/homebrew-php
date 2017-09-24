require File.expand_path("../../language/php", __FILE__)

class PhanAT08 < Formula
  include Language::PHP::Composer

  desc "Static analyzer for PHP"
  homepage "https://github.com/phan/phan"
  url "https://github.com/phan/phan/archive/0.8.8.tar.gz"
  sha256 "44504aac5e98431dd7beceec9f96f9d601d7c3f15cf1c579f7203a36cb607235"
  head "https://github.com/phan/phan.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "18825c0adc215e31adb78ad4913077498e09bfcd0dff1e8df34d49733c03ee99" => :sierra
    sha256 "ce78c87943311aa2d067fe88c1bff4724dbd38f023a3e5e0c82173c7c22d5183" => :el_capitan
    sha256 "6bd6bdce03d37db0ae61b8002c69bc9a089ee54cfbcd23bb9165b6841fd937a8" => :yosemite
  end

  depends_on "php70-ast"
  depends_on "php70"

  def install
    composer_install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"phan"
  end

  test do
    system "#{bin}/phan", "--help"
  end
end
