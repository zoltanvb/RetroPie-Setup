#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-ep128emu"
rp_module_desc="Enterprise 128 and Videoton TVC emulator"
rp_module_help="ROM Extensions: .cdt .cpc .dsk\n\nCopy your Enterprise games to $romdir/enterprise128, Videoton TVC games to $romdir/videotontvc"
rp_module_licence="GPL2 https://raw.githubusercontent.com/libretro/ep128emu-core/refs/heads/core/COPYING"
rp_module_repo="git https://github.com/libretro/ep128emu-core.git core"
rp_module_section="exp"

function sources_lr-ep128emu() {
    gitPullOrClone
}

function build_lr-ep128emu() {
    make clean
    make
    md_ret_require="$md_build/ep128emu_core_libretro.so"
}

function install_lr-ep128emu() {
    md_ret_files=(
        'ep128emu_core_libretro.so'
    )
}

function configure_lr-ep128emu() {
    mkRomDir "enterprise128"
    ensureSystemretroconfig "enterprise128"

    addEmulator 1 "$md_id" "enterprise128" "$md_inst/ep128emu_core_libretro.so"
    addSystem "enterprise128"

    mkRomDir "videotontvc"
    ensureSystemretroconfig "videotontvc"

    addEmulator 1 "$md_id" "videotontvc" "$md_inst/ep128emu_core_libretro.so"
    addSystem "videotontvc"

}

