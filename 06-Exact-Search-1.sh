source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find -mindepth 1 -not -name '.*' -name 'zsh' | sort)

test_start "Searches for an EXACT string across the full test directory"

cd "${TEST_DIR}/inputs/test-fs"
run "${TEST_DIR}/../search" -e . zsh
program_output=$(sort <<< "${program_output}")

compare_outputs

test_end
