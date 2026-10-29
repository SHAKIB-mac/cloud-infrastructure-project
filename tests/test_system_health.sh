#!/bin/bash

SCRIPT="$(dirname "$0")/../scripts/system_health.sh"

passed=0
failed=0

echo "================================"
echo " CLOUDOPS MONITOR TEST SUITE"
echo "================================"

# Test 1: Syntax validation
echo ""
echo "Test 1: Syntax validation"

if bash -n "$SCRIPT"; then
    echo "PASS: Syntax valid"
    ((passed++))
else
    echo "FAIL: Syntax error"
    ((failed++))
fi

# Test 2: Normal health
echo ""
echo "Test 2: Normal health"

"$SCRIPT" >/dev/null
result=$?

if [ "$result" -eq 0 ]; then
    echo "PASS: Healthy status"
    ((passed++))
else
    echo "FAIL: Expected exit code 0, got $result"
    ((failed++))
fi

# Test 3: High CPU
echo ""
echo "Test 3: High CPU"

TEST_CPU=85 "$SCRIPT" >/dev/null 2>&1
result=$?

if [ "$result" -eq 1 ]; then
    echo "PASS: CPU warning detected"
    ((passed++))
else
    echo "FAIL: CPU warning not detected"
    ((failed++))
fi

# Test 4: High memory
echo ""
echo "Test 4: High memory"

TEST_MEMORY=90 "$SCRIPT" >/dev/null 2>&1
result=$?

if [ "$result" -eq 1 ]; then
    echo "PASS: Memory warning detected"
    ((passed++))
else
    echo "FAIL: Memory warning not detected"
    ((failed++))
fi

# Test 5: High disk
echo ""
echo "Test 5: High disk"

TEST_DISK=90 "$SCRIPT" >/dev/null 2>&1
result=$?

if [ "$result" -eq 1 ]; then
    echo "PASS: Disk warning detected"
    ((passed++))
else
    echo "FAIL: Disk warning not detected"
    ((failed++))
fi

echo ""
echo "================================"
echo " TEST SUMMARY"
echo "================================"
echo "Passed: $passed"
echo "Failed: $failed"

if [ "$failed" -eq 0 ]; then
    echo "RESULT: ALL TESTS PASSED"
    exit 0
else
    echo "RESULT: SOME TESTS FAILED"
    exit 1
fi
