require "test/unit/assertions"
include Test::Unit::Assertions

def ExtractEvenAndOddIndexInAString(string)
    even = []
    odd = []
    for i in 0..string.length-1
        if i%2 == 0
            even.insert(-1, string[i])
        else
            odd.insert(-1, string[i])
        end
     end
     return {'even' => even.join, 'odd' => odd.join}
end

def VerifyArray(array)
    if !array.is_a?(Array)
        raise StandardError.new "must be an array."
    end
    if !array.all? { |index| index.is_a? String }
        raise StandardError.new "must be arrays of strings."
    end 
end

def VerifyArraysLength(a, b)
    if a.length != b.length
        raise StandardError.new "The lengths of a and b are mandatory to be the same."
    end
end

def VerifyTwins(a, b)
    VerifyArray(a)
    VerifyArray(b)
    result = []
    for i in 0..a.length-1
        if a[i].length == b[i].length
            evenAndOddOfA = ExtractEvenAndOddIndexInAString(a[i])
            evenAndOddOfB = ExtractEvenAndOddIndexInAString(b[i])
            if  evenAndOddOfA['even'].chars.sort.join == evenAndOddOfB['even'].chars.sort.join &&
                evenAndOddOfA['odd'].chars.sort.join == evenAndOddOfB['odd'].chars.sort.join
                result.insert(-1, 'yes')
            else
                result.insert(-1, 'no')
            end
        else
            result.insert(-1, 'no')
        end
    end
    return result
end


class TestVerifyTwins
    def test_string_should_raise_an_error_a_and_b_must_be_arrays
        testA = 'abc'
        testB = 'abc'
        err = assert_raise('StandardError') {VerifyTwins(testA, testB)}
        assert_equal 'must be arrays.', err.message, 'VerifyTwins function should return must be arrays.'
    end
    def test_integer_should_raise_an_error_a_and_b_must_be_arrays
        testA = 123
        testB = 321
        err = assert_raise('StandardError') {VerifyTwins(testA, testB)}
        assert_equal 'must be arrays.', err.message, "VerifyTwins function should return 'must be arrays.'"
    end
    def test_arrays_containing_integer_should_raise_an_error_a_and_b_must_be_arrays_of_strings
        testA = ['abcd', 321, 'kkkk']
        testB = ['cdab', 'bcdakg', 'klhjkiudfdjhfjdfjh']
        err = assert_raise('StandardError') {VerifyTwins(testA, testB)}
        assert_equal 'must be arrays of strings.', err.message, "VerifyTwins function should return 'must be arrays of strings.'"
    end
    def test_arrays_containing_arrays_should_raise_an_error_a_and_b_must_be_arrays_of_strings
        testA = [['kkkk', 'jjjjj'], ['kkkk', 'jjjjj']]
        testB = ['kkkk', 'jjjjj']
        assert_raise('StandardError') {VerifyTwins(testA, testB)}
        assert_equal 'must be arrays of strings.', err.message, "VerifyTwins function should return 'must be arrays of strings.'"
    end
    def test_verifytwins_should_return_single_array_of_yes_given_one_twins_arrays
        testA = ['abcd']
        testB = ['cdab']
        assert_equal ['yes'], VerifyTwins(testA, testB), "VerifyTwins function should return 'yes'"
    end
    def test_verifytwins_should_return_single_array_of_yes_given_an_twins_arrays_containing_number
        testA = ['12345']
        testB = ['54321']
        assert_equal ['yes'], VerifyTwins(testA, testB), "VerifyTwins function should return 'yes'"
    end
    def test_verifytwins_should_return_single_array_of_no_given_two_arrays_with_different_length
        testA = ['abc']
        testB = ['ab']
        assert_equal ['no'], VerifyTwins(testA, testB), "VerifyTwins function should return 'no'"
    end
    def test_verifytwins_should_return_single_array_of_no_given_two_arrays_are_not_twins
        testA = ['abcd']
        testB = ['bcda']
        assert_equal ['no'], VerifyTwins(testA, testB), "VerifyTwins function should return 'no'"
    end
    def test_verifytwins_should_return_four_array_of_yes_no_yes_yes
        testA = ['abcd', 'abcdgg', 'klhjkiudfdjhfjdhjf', 'zErRTGdfgt']
        testB = ['cdab', 'bcdakg', 'klhjkiudfdjhfjdfjh', 'zErGTRgfdt']
        assert_equal ['yes', 'no', 'yes', 'yes'], VerifyTwins(testA, testB), "VerifyTwins function should return 'yes', 'no', 'yes'"
    end
end