class Cdec < Formula
  desc "Decoder, aligner, and model optimizer for statistical machine translation and other structured prediction models based on (mostly) context-free formalisms"
  homepage "https://github.com/redpony/cdec"
  head "https://github.com/redpony/cdec.git"

  depends_on "bjam" => :build
  depends_on "boost" => :build
  depends_on "flex" => :build
  depends_on "cmake" => :build

  def install
    system "cmake", "."
    system "bjam", "install", "-j4", "--prefix=#{prefix}"
  end

  def test
    system "make", "test"
    system "perl", "tests/run-system-tests.pl"
  end

end
