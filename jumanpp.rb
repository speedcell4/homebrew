class Jumanpp < Formula
  desc "A Morphological Analyzer Toolkit"
  homepage "http://nlp.ist.i.kyoto-u.ac.jp/EN/index.php?JUMAN++"
  url "https://github.com/ku-nlp/jumanpp/archive/v2.0.0-rc3.tar.gz"
  sha256 "b5ff1e6f712224297454af7771f29ca5642fbe875de35ab850da2d78a67e17dc"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}/build"
      system "make", "-j4"
    end

    bin.install "build/src/jumandic/jumanpp_v2"
    bin.install "build/src/jumandic/jumanpp_v2_train"
    bin.install "build/src/jumandic/jpp_jumandic_bootstrap"
    bin.install "build/src/jumandic/jpp_jumandic_cg_codegen_binary"
  end

  test do
    system "build/src/jumandic/jpp_bug_tests"
    system "build/src/jumandic/jpp_jumandic_tests"
    system "build/src/core/jpp_core_tests"
    system "build/src/rnn/jpp_rnn_tests"
    system "build/src/testing/testing_infra_test"
    system "build/src/util/jpp_util_test"
  end
end
