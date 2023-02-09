source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find ./tiny -mindepth 1 | sort)

test_start "Checks the output against the test dev directory"

program_output=$(\
    cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/../search ./tiny \
    | sort)

compare_outputs

test_end
