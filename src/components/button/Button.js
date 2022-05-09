import './Button.css';
import React from 'react';

export default function Button({ children, ...other }) {
    return(
        <div className='Button' {...other}>
            {children}
        </div>
    );
}
