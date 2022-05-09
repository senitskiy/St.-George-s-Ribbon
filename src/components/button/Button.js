import './Button.css';
import React from 'react';

export default function Button({ children }) {
    return(
        <div className='Button'>
                {children}
        </div>
    );
}
