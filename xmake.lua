add_rules("mode.debug", "mode.release")
-- set_warnings("all", "error")
set_languages("c++17")

add_requires("gtest")
-- add_requires("benchmark")

add_cxxflags("cl::/utf-8", {force = true})

target("OpenString")
    set_kind("static")
    add_includedirs("include")
    add_files("source/*.cpp")
target_end()

target("test")
    set_kind("binary")
    add_packages("gtest")
    add_includedirs("include")
    add_files("test/*.cpp")
    add_deps("OpenString")
target_end()

target("OpenStringCxx20")
    set_kind("static")
    add_includedirs("include")
    add_files("source/*.cpp")

    set_languages("c++20")
    add_defines("OSTR_USE_CXX20_CHAR8_TYPE", {public = true})
target_end()

target("test20")
    set_kind("binary")
    add_packages("gtest")
    add_includedirs("include")
    add_files("test/*.cpp")

    set_languages("c++20")
    add_deps("OpenStringCxx20")
target_end()

target("OpenStringCxx20NoC8")
    set_kind("static")
    add_includedirs("include")
    add_files("source/*.cpp")

    set_languages("c++20")
target_end()

target("test20noc8")
    set_kind("binary")
    add_packages("gtest")
    add_includedirs("include")
    add_files("test/*.cpp")

    set_languages("c++20")
    add_deps("OpenStringCxx20NoC8")
target_end()

-- target("benchmark")
--     set_kind("binary")
--     add_cxflags(cxflags, {force = true})
--     add_packages("benchmark")
--     add_includedirs("include")
--     add_deps("OpenString")
--     add_files("benchmark/*.cpp")

--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

