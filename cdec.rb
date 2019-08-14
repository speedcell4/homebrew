class Cdec < Formula
  desc "Decoder, aligner, and model optimizer for statistical machine translation and other structured prediction models based on (mostly) context-free formalisms"
  homepage "https://github.com/redpony/cdec"
  head "https://github.com/redpony/cdec.git"

  depends_on "boost" => :build
  depends_on "flex" => :build
  depends_on "cmake" => :build

  def install
    system "cmake", "."
    system "make", "-j4"

    bin.install Dir["corpus/*.sh"]
    bin.install Dir["corpus/*.pl"]
    bin.install Dir["corpus/*.py"]
    bin.install "klm/lm/build_binary"
    bin.install "klm/lm/ngram_query"
    bin.install "training/mira/mira.py"
    bin.install "word-aligner/fast_align"
    bin.install "utils/atools"
    bin.install "extractor/sacompile"
    bin.install "extractor/extract"
  end

  def test
    system "make", "test"
    # system "perl", "tests/run-system-tests.pl"
  end

end
