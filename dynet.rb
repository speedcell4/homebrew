class Dynet < Formula
  desc "The Dynamic Neural Network Toolkit"
  homepage "https://dynet.readthedocs.io/en/latest"
  url "https://github.com/clab/dynet/archive/2.1.tar.gz"
  head "https://github.com/clab/dynet.git"
  sha256 "72d5c2a0c7dece6b91426f02993f640297f6c5f7de1907d4eb587796e97022bc"

  depends_on "eigen" => :build
  depends_on "cmake" => :build
  depends_on "boost" => :recommended

  def install
    args = []

    if !build.without? "boost"
      args << "-DENABLE_BOOST=ON"
    end

    mkdir "build" do
      system "cmake", "..", "-DEIGEN3_INCLUDE_DIR=#{Formula["eigen"].opt_include}/eigen3", "-DENABLE_CPP_EXAMPLES=ON", *args
      system "make", "-j4"
    end
    
    lib.install "build/dynet/libdynet.dylib"
  end

  def test
    system "examples/xor"
  end

end
