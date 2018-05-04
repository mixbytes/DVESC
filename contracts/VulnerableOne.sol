pragma solidity 0.4.23;

import "zeppelin-solidity/contracts/math/SafeMath.sol";


contract VulnerableOne {
    using SafeMath for uint;

    struct UserInfo {
		// [HINT] not needed, spent gaz and storage space, but this value can be calculated lookin at transactions and blockchain
        uint256 created;
		uint256 ether_balance;
    }

    mapping (address => UserInfo) public users_map;

	// [HINT] can store bool value in UserInfo struct (only if there is no need for separate structure for other reasons)
	mapping (address => bool) is_super_user;

	address[] users_list;

	modifier onlySuperUser() {
        require(is_super_user[msg.sender] == true);
        _;
    }

    event UserAdded(address new_user);

    constructor() public {
		add_new_user(msg.sender);
		set_super_user(msg.sender);
	}

	// [HINT] forgotten critical access modifier
	function set_super_user(address _new_super_user) public {
		is_super_user[_new_super_user] = true;
	}

	function add_new_user(address _new_user) public {
		require(users_map[_new_user].created == 0);
		// [HINT] no check of 0x0 address (0x0 can become a valid member of users_map)

		// [HINT] event can be fired but user is not added yet
    	emit UserAdded(_new_user);

		users_map[_new_user] = UserInfo({ created: now, ether_balance: 0 });
	}

	function get_user_balance(address _user) view returns(uint256) {
		return users_map[_user].ether_balance;
	}

}
