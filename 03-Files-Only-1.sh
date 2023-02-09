source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find ./tiny -mindepth 1 -type f | sort)

test_start "Repeats the previous test, but only shows files."

program_output=$(\
    cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/../search ./tiny -f \
    | sort)

compare_outputs

test_end
