// import logo from './logo.svg';
import './App.css';
import ribbon from './images/ribbon.png';
import Button from "./components/button/Button";
import WebFont from 'webfontloader';
import {useEffect} from "react";
import Card from "./components/card/Card";
import React from 'react';
import Web3 from 'web3'

function App() {

    useEffect(() => {
        WebFont.load({
            google: {
                families: ['Josefin Sans']
            }
        })
    }, []);

    return (<div className="App">
        <header className="App-header">
                <span className='header'>
                    NFT MarketPlace
                </span>
            <Button>
                Connect Wallet
            </Button>
        </header>
        <main className="App-main">
            <div className='about'>
                <span className='title'>
                    Get your ribbon!
                </span>
                <img className='ribbon' src={ribbon}/>
            </div>
            <div className='container-card'>
                <Card />
            </div>
        </main>
        <footer className='App-footer'>
                <span className='all-rights'>
                    2022 All rights reserved
                </span>
            <div>

            </div>
        </footer>
    </div>);
}

export default App;
