// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.19;

import {Component} from "./Component.sol";
import {IProduct} from "./IProduct.sol";


contract Product is
    Component,
    IProduct
{
    address private _pool;

    constructor(
        address registry, 
        address instance, 
        address pool
    )
        Component(registry, instance)
    { 
        _pool = pool;
    }

    function getPoolNftId() external view override returns(uint256 poolNftId) {
        return _registry.getNftId(_pool);
    }

    // from registerable
    function getType() public view override returns(uint256) {
        return _registry.PRODUCT();
    }

    // from registerable
    function getData() external view override returns(bytes memory data) {
        return bytes(abi.encode(getInstance().getNftId()));
    }
}