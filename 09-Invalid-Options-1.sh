source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find . -mindepth 1 -name 'pool' | sort)

test_start "Tries to run the program with a variety of incorrect options"


# Invalid directory -- if the directory passed in doesn't exist, return 1
${TEST_DIR}/../search -e "${TEST_DIR}/bananas" avocados
if [[ $? -ne 1 ]]; then
    test_end 1
fi

# Invalid limit. Should return 1
${TEST_DIR}/../search -l san_francisco "${TEST_DIR}"
if [[ $? -ne 1 ]]; then
    test_end 1
fi

# Invalid option. Return 1
${TEST_DIR}/../search -z -x san_francisco "${TEST_DIR}"
if [[ $? -ne 1 ]]; then
    test_end 1
fi

# This should actually work :-)
${TEST_DIR}/../search > /dev/null
if [[ $? -ne 0 ]]; then
    test_end 1
fi

test_end 0
