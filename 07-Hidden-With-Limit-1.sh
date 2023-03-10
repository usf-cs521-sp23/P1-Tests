source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find -mindepth 1 -maxdepth 4 -type f -name '*uuid*' | sort)

test_start "Searches for files (including hidden) with a traversal limit of 4."

cd "${TEST_DIR}/inputs/test-fs"
run "${TEST_DIR}/../search" -l 4 -h -f . uuid
program_output=$(sort <<< "${program_output}")

compare_outputs

test_end
