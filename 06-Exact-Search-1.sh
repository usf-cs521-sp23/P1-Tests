source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find -mindepth 1 -not -name '.*' -name 'zsh' | sort)

test_start "Searches for an EXACT string across the full test directory"

program_output=$(\
    cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/../search -e . zsh \
    | sort)

compare_outputs

test_end
