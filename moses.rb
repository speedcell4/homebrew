class Moses < Formula
  desc "Moses, the machine translation system"
  homepage "http://www.statmt.org/moses"
  url "https://github.com/moses-smt/mosesdecoder/archive/RELEASE-4.0.tar.gz"
  sha256 "357376cdbb225a17cdf17195625d0fa7e10d722807e9e0b8a633ffbd7eec9b8f"

  depends_on "bjam" => :build
  depends_on "boost" => :recommended
  depends_on "libcmph" => :recommended
  depends_on "xmlrpc-c" => :recommended

  def install
    args = %w[]
    if !build.without? "boost"
      args << "--with-boost=#{Formula["boost"].opt_prefix}"
    end
    if !build.without? "libcmph"
      args << "--with-cmph==#{Formula["libcmph"].opt_prefix}"
    end
    if !build.without? "xmlrpc-c"
      args << "--with-xmlrpc-c=#{Formula["xmlrpc-c"].opt_prefix}"
    end

    system Formula["bjam"].opt_bin/"bjam", "-j4", *args
  end
end
