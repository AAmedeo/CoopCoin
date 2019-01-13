pragma solidity >=0.4.22 <0.6.0;

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract CoopCoin {
	mapping (address => uint) balances;
	address creator;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	constructor() public {
		creator = msg.sender;
	}

	function registerPayment(address sender, address receiver, uint amount) public returns(bool sufficient) {
		balances[sender] += amount;
		balances[receiver] += amount/2;
		emit Transfer(sender, receiver, amount);
		return true;
	}

	function getCoopCoinBalance(address account) public view returns(uint) {
		return balances[account];
	}

	function isCreator(address account) public view returns(bool) {
		return (account == creator);
	}
}