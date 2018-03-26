pragma solidity ^0.4.18;
import "./RIKKI_TOKEN.sol";
contract RKstore{
    struct store_item{
        bool hasBought;
        address boughtby;
        uint256 value;
        string photo;
    }
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    RIKKI_TOKEN  rkt =  RIKKI_TOKEN(0x83ea36A764F46963A2BB024C43889A82A926a041);
    address owner;

    function RKstore() public{
        owner = msg.sender;
    }

    mapping(uint256 => store_item)public storeItems;

    function initStore() public onlyOwner {
        storeItems[0] = store_item(false,address(0),50,"https://images.unsplash.com/photo-1466684921455-ee202d43c1aa?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b81428c4ce41e0571b43859dc0e28e6b&auto=format&fit=crop&w=1050&q=80");
        storeItems[1] = store_item(false,address(0),105,"https://images.unsplash.com/3/www.madebyvadim.com.jpg?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0d00b2e84a1695cf3c46c8eda5548195&auto=format&fit=crop&w=1061&q=80");
        storeItems[2] = store_item(false,address(0),80,"https://images.unsplash.com/photo-1497339100210-9e87df79c218?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=deb85808f71039e3e039fdb18ba26019&auto=format&fit=crop&w=1050&q=80");
        storeItems[3] = store_item(false,address(0),70,"https://images.unsplash.com/photo-1441984344779-4716bd9e6b04?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c776add765c0f78a8fb5a00e84e2ec73&auto=format&fit=crop&w=1121&q=80");
        storeItems[4] = store_item(false,address(0),35,"https://images.unsplash.com/photo-1518425636460-9cf03017a5ed?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=31ac7d61d50dade22e0da90c1110aa7e&auto=format&fit=crop&w=1050&q=80");
        storeItems[5] = store_item(false,address(0),105,"https://images.unsplash.com/photo-1481608726045-7407244fb7b6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=36ff3029b39c4bd1892c44308118d53b&auto=format&fit=crop&w=1051&q=80");
        storeItems[6] = store_item(false,address(0),60,"https://images.unsplash.com/photo-1507975456351-a41d6828b9c8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae95d76bce1628ab385aa5e5cb6c57cb&auto=format&fit=crop&w=1050&q=80");
        storeItems[7] = store_item(false,address(0),70,"https://images.unsplash.com/photo-1449505278894-297fdb3edbc1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e4f3b47048a2518f436335d515d7fee5&auto=format&fit=crop&w=1050&q=80");
        storeItems[8] = store_item(false,address(0),20,"https://images.unsplash.com/photo-1486012355952-89f0d82ac311?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=50590e03f93c519b8a2b9fd2e8ffe271&auto=format&fit=crop&w=1050&q=80");
        storeItems[9] = store_item(false,address(0),150,"https://images.unsplash.com/photo-1513348313239-6ccc6c25c11b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5d6844935b6492ad61b9988d60661d9e&auto=format&fit=crop&w=1050&q=80");
        storeItems[10] = store_item(false,address(0),45,"https://images.unsplash.com/photo-1518131672697-613becd4fab5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cb83a90eb70b431ca38229d3100c2b1f&auto=format&fit=crop&w=1050&q=80");
        storeItems[11] = store_item(false,address(0),55,"https://images.unsplash.com/photo-1466837703337-242d94d6b8c7?ixlib=rb-0.3.5&s=ba561377f79d7cdb2c8489b737a3e83f&auto=format&fit=crop&w=1050&q=80");
    }

    function buyItem(uint256 item_id) public{
        require(rkt.getBalance(msg.sender) >= storeItems[item_id].value);
        rkt.transfer(owner,1000);
        storeItems[item_id].hasBought = true;
        storeItems[item_id].boughtby = msg.sender;
    }
    function killContract() public onlyOwner{
        selfdestruct(owner);
    }

}