'use strict';

const VulnerableOne = artifacts.require('VulnerableOne.sol');

contract('VulnerableOneTest', function(accounts) {

    it('super test', async function() {
	   const roles = {                                                                                                                                                                     
        	superalice: accounts[0],                                                                                                                                                              
        	badbob: accounts[0],                                                                                                                                                            
        	hz_eva: accounts[1],                                                                                                                                                            
       		user222: accounts[2],                                                                                                                                                         
        	user555: accounts[3],                                                                                                                                                         
        	nobody: accounts[4]                                                                                                                                                             
    	};              
		const contract = await VulnerableOne.new({from: roles.superalice });

        //await contract.add_new_user(roles.badbob, {from: roles.superalice});

    });

});
