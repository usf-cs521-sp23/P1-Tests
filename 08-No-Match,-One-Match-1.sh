source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find . -mindepth 1 -name 'loop-control' | sort)

test_start "Performs a search with no matches, and one with a single match."

program_output=$(\
    cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/../search -e . pool\
    | sort)

compare <(echo "") <(echo "${program_output}") || test_end 1

program_output=$(\
    cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/../search -e . loop-control \
    | sort)

compare_outputs

test_end
