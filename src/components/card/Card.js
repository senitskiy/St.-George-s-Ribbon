import './Card.css';
import Button from "../button/Button";
import React from 'react';

export default function Card() {
    return(
        <div className='Card'>
            <div className='total'>from 1 to 10 000</div>
            {/* <div className='counter'>0 GLMR</div> */}
            <Button>MINT</Button>
        </div>
    );
}
