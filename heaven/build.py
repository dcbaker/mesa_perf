#!/usr/bin/python

import os
import sys
import os.path as path
sys.path.append(path.join(path.dirname(path.abspath(sys.argv[0])), "..", "repos", "mesa_ci"))
import build_support as bs


bs.build(bs.PerfBuilder("heaven", iterations=5,
                        env={"allow_glsl_extension_directive_midshader":"true",
                             "dual_color_blend_by_location":"true"}))

