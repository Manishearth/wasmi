echo "starting local CI ..."
echo "    Formatting ..."
cargo +nightly fmt;
echo "    Building ..."
cargo build --workspace;
echo "    Clippy ..."
cargo clippy --workspace -- -D warnings;
echo "    Docs ..."
cargo doc --workspace --all-features --no-deps --document-private-items;
echo "    Testing Spec ..."
cargo test --release --quiet spec::v1;
echo "    Testing Package ..."
cargo test --package wasmi --quiet;
