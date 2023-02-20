source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find . -mindepth 1 -name 'loop-control' | sort)

test_start "Performs a search with no matches, and one with a single match."

cd "${TEST_DIR}/inputs/test-fs"
run "${TEST_DIR}/../search" -e . pool

compare <(echo "") <(echo "${program_output}") || test_end 1

run "${TEST_DIR}/../search" -e . loop-control
program_output=$(sort <<< "${program_output}")

compare_outputs

test_end
