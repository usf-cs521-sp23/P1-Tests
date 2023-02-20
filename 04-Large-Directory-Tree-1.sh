source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find -mindepth 1 -not -name '.*' | sort)

test_start "Checks the output against the full test directory"

# Note that here we don't specify the search directory, so the program should
# default to the CWD (.)

cd "${TEST_DIR}/inputs/test-fs"
run "${TEST_DIR}/../search"
program_output=$(sort <<< "${program_output}")

compare_outputs

test_end
