add_rules("mode.debug", "mode.release")

target("brotlienc")
    set_kind("$(kind)")
    add_deps("brotlicommon")
    add_rules("utils.install.pkgconfig_importfiles", {filename = "libbrotlienc.pc"})
    add_includedirs("c/include", {public = true})
    add_files("c/enc/*.c")
    if is_kind("shared") and is_plat("windows") then
        add_defines("BROTLI_SHARED_COMPILATION", "BROTLIENC_SHARED_COMPILATION")
    end
    add_headerfiles("c/include/(brotli/*.h)")

target("brotlidec")
    set_kind("$(kind)")
    add_deps("brotlicommon")
    add_rules("utils.install.pkgconfig_importfiles", {filename = "libbrotlidec.pc"})
    add_includedirs("c/include", {public = true})
    add_files("c/dec/*.c")
    if is_kind("shared") and is_plat("windows") then
        add_defines("BROTLI_SHARED_COMPILATION", "BROTLIDEC_SHARED_COMPILATION")
    end
    add_headerfiles("c/include/(brotli/*.h)")

target("brotlicommon")
    set_kind("$(kind)")
    add_rules("utils.install.pkgconfig_importfiles", {filename = "libbrotlicommon.pc"})
    add_includedirs("c/include", {public = true})
    add_files("c/common/*.c")
    if is_kind("shared") and is_plat("windows") then
        add_defines("BROTLI_SHARED_COMPILATION", "BROTLICOMMON_SHARED_COMPILATION")
    end
    add_headerfiles("c/include/(brotli/*.h)")

target("brotli")
    set_kind("binary")
    add_files("c/tools/brotli.c")
    add_deps("brotlicommon", "brotlidec", "brotlienc")