source "${TEST_LIB}/funcs.bash"

test_start "Static Analysis" \
    "Checks for programming and stylistic errors with cppcheck and gcc/clang"

if ! ( which cppcheck &> /dev/null ); then
    # "cppcheck is not installed. Please install (as root) with:"
    # "pacman -Sy cppcheck"
    test_end 1
fi

# Use cppcheck to check for code issues
cppcheck --enable=warning,performance \
    --error-exitcode=1 \
    "${TEST_DIR}/../search.c" || test_end 1

# Make sure there are no compiler warnings
cc -Wall -Werror "${TEST_DIR}"/../search.c -o /dev/null || test_end 1

# Finally, if README.md is not filled out (still has TODOs), this test fails.
grep 'TODO' "${TEST_DIR}/../README.md" && test_end 1

test_end
