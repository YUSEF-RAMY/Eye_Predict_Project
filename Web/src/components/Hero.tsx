import React, { useEffect, useState } from "react";
import Navbar from "./Navbar";
import "./Hero.css";

type Slide = {
  id: number;
  title: string;
  text: string;
};

const slides: Slide[] = [
  {
    id: 0,
    title: "We Provide Best Healthcare",
    text:
      "Explicabo esse amet tempora quibusdam laudantium, laborum eaque magnam fugiat hic? Esse dicta aliquid error repudiandae earum suscipit fugiat molestias, veniam, vel architecto veritatis delectus repellat modi impedit sequi.",
  },
  {
    id: 1,
    title: "Trusted Medical Professionals",
    text:
      "We have experienced doctors, nurses, and staff ready to give you the best treatment and care you deserve.",
  },
  {
    id: 2,
    title: "Your Health, Our Priority",
    text:
      "Our mission is to provide reliable healthcare services, making your health and well-being our top concern.",
  },
];

const Hero: React.FC = () => {
  const [index, setIndex] = useState(0);

  useEffect(() => {
    const t = setInterval(() => {
      setIndex((i) => (i + 1) % slides.length);
    }, 4500);
    return () => clearInterval(t);
  }, []);

  return (
    <section className="hero_area"id="home">
      {/* الخلفية */}
      <div className="hero_bg_box">
        <img src="/images/hero-bg.png" alt="background" />
      </div>

      {/* النافبار */}
      <Navbar />

      {/* السلايدر */}
      <div className="slider_section">
        <div className="slider_inner">
          <div className="detail-box">
            <h1>{slides[index].title}</h1>
            <p>{slides[index].text}</p>
            <div className="btn-box">
              <a className="btn1" href="#">
                Read More
              </a>
            </div>
          </div>
        </div>

        {/* Indicators تحت الكلام */}
        <div className="carousel-indicators">
          {slides.map((s) => (
            <button
              key={s.id}
              className={`indicator ${s.id === index ? "active" : ""}`}
              onClick={() => setIndex(s.id)}
              aria-label={`Go to slide ${s.id + 1}`}
            />
          ))}
        </div>
      </div>
    </section>
  );
};

export default Hero;

