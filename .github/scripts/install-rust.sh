#!/bin/bash
set -e 

ARCH=$(uname -m)

if [ "$ARCH" = "riscv64" ]; then
  echo "--- Installing Rust toolchain for RISC-V via apt ---"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
  echo "--- Rust toolchain installed successfully ---"
  rustc --version
  cargo --version
  rustup set default-host riscv64gc-unknown-linux-gnu
else
  echo "--- Not a riscv64 build, skipping Rust installation ---"
fi