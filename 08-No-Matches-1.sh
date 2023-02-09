source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find . -mindepth 1 -name 'pool' | sort)

test_start "Checks the output against the full test directory"

# Note that here we don't specify the search directory, so the program should
# default to the CWD (.)

program_output=$(\
    cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/../search -e . pool\
    | sort)

compare_outputs

test_end
