source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(find "${TEST_DIR}/inputs/test-fs/tiny" -mindepth 1 -type d | sort)

test_start "Reruns the small directory test but ignores files."

# This output might be really big because it uses the full absolute path of the
# test directory. If you can't see the full path, resize your terminal window.

run "${TEST_DIR}/../search" "${TEST_DIR}/inputs/test-fs/tiny" -d
program_output=$(sort <<< "${program_output}")

compare_outputs

test_end
