source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(find "${TEST_DIR}/inputs/test-fs/tiny" -mindepth 1 -type d | sort)

test_start "Reruns the small directory test but ignores files."

# This output might be really big because it uses the full absolute path of the
# test directory. If you can't see the full path, resize your terminal window.

program_output=$(\
    ${TEST_DIR}/../search "${TEST_DIR}/inputs/test-fs/tiny" -d \
    | sort)

compare_outputs

test_end
