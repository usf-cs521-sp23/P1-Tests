source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find ./tiny -mindepth 1 | sort)

test_start "Checks output against the tiny test directory"

# See tests/inputs/test-fs for test directories

cd "${TEST_DIR}/inputs/test-fs"
run "${TEST_DIR}/../search" ./tiny
program_output=$(sort <<< "${program_output}")

compare_outputs

test_end
