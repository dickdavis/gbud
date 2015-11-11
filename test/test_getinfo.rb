require 'test/unit'
require '../gbud/lib/gbud/getinfo.rb'

# test methods in getinfo module
class GetInfoTest < Test::Unit::TestCase
  def test_take_input
    with_stdin do |user|
      user.puts 'test'
      assert_equal(
        GetInfo.new('Test prompt =>').take_input, 'test')
    end
  end

  def test_verify_input_one
    with_stdin do |user|
      user.puts 'Y'
      assert_equal(
        GetInfo.new('Test prompt =>').verify_input, true)
    end
  end

  def test_verify_input_two
    with_stdin do |user|
      user.puts 'Y'
      assert_equal(
        GetInfo.new('Test prompt =>').verify_input, true)
    end
  end

  def test_verify_input_fail
    with_stdin do |user|
      user.puts 'N'
      assert_equal(
        GetInfo.new('Test prompt =>').verify_input, false)
    end
  end

  def test_user_prompt
    with_stdin do |user|
      user.puts 'test'
      user.puts 'Y'
      assert_equal(GetInfo.new('Test prompt =>').user_prompt, 'test')
    end
  end

  def with_stdin
    stdin = $stdin             # remember $stdin
    $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
    yield write                # pass pipe's "write end" to block
  ensure
    write.close                # close pipe
    $stdin = stdin             # restore $stdin
  end
end
