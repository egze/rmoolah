require 'helper'
 
class TestTransaction < MiniTest::Unit::TestCase
  
  def test_should_create_transaction
    stub_request(:get, /.*moolah.*/).to_return(:body => File.new(File.dirname(__FILE__) + '/fixtures/create_success.json'), :status => 200)
    tr = Rmoolah::Transaction.new("abababab", 50, "USD", "My Product", "http://cligs.com", "http://cligs.com").create
    assert_equal "DMU2tcx9Fe8nsDXEUA2SkBynJt1KXXXXXX", tr.address
    assert_equal 1337.1337, tr.amount_to_pay
    assert_equal "DOGE", tr.currency_to_pay
    assert_equal "322fabc5-1111-1111-1111-688eb8271204", tr.tx
    assert_equal 'https://moolah.io/api/tx/322fabc5-1111-1111-1111-688eb8271204', tr.url
  end
  
  def test_should_fetch_transaction
    stub_request(:get, /.*moolah.*/).to_return(:body => File.new(File.dirname(__FILE__) + '/fixtures/fetch_success.json'), :status => 200)
    tr = Rmoolah::Transaction.fetch("322fabc5-1111-1111-1111-688eb8271204")
    assert_equal "DMU2tcx9Fe8nsDXEUA2SkBynJt1KXXXXXX", tr.address
    assert_equal 0, tr.received
    assert_equal "pending", tr.status
    assert_equal "322fabc5-1111-1111-1111-688eb8271204", tr.tx
  end
  
end