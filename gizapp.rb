class Gizapp < Formula
  desc "GIZA++ is a statistical machine translation toolkit that is used to train IBM Models 1-5 and an HMM word alignment model. This package also contains the source for the mkcls tool which generates the word classes necessary for training some of the alignment models. "
  homepage "http://www.fjoch.com/GIZA++.html"
  url "https://github.com/moses-smt/giza-pp.git"

  depends_on "gcc" => :build

  def install
    ENV["CXX"] = Formula["gcc"].opt_bin/"g++-9"
    ENV["CFLAGS_GLOBAL"] = "-static-libstdc++"

    system "make", "all", "-j4" 
    
    bin.install "GIZA++-v2/GIZA++"
    bin.install "mkcls-v2/mkcls"
  end
end
