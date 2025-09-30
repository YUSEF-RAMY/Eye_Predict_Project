import React, { useState } from "react";
import "./Navbar.css";

const Navbar: React.FC = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <header className="navbar">
      <div className="container">
        <div className="logo">Eye predect</div>

        <nav className={`nav-links ${isOpen ? "open" : ""}`}>
          <a href="#home">Home</a>
          <a href="#Departments">Departments</a>
          <a href="#Check">Check your eye</a>
          
        </nav>

        <button
          className="hamburger"
          onClick={() => setIsOpen(!isOpen)}
          aria-label="Toggle menu"
        >
          ☰
        </button>
      </div>
    </header>
  );
};

export default Navbar;

