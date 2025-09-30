import React from "react";
import "./Department.css";

type Department = {
  id: number;
  title: string;
  text: string;
  img: string;
};

const departments: Department[] = [
  {
    id: 1,
    title: "Cardiology",
    text: "fact that a reader will be distracted by the readable page when looking at its layout.",
    img: "/images/s1.png",
  },
  {
    id: 2,
    title: "Diagnosis",
    text: "fact that a reader will be distracted by the readable page when looking at its layout.",
    img: "/images/s2.png",
  },
  {
    id: 3,
    title: "Surgery",
    text: "fact that a reader will be distracted by the readable page when looking at its layout.",
    img: "/images/s3.png",
  },
  {
    id: 4,
    title: "First Aid",
    text: "fact that a reader will be distracted by the readable page when looking at its layout.",
    img: "/images/s4.png",
  },
];

const Department: React.FC = () => {
  return (
    <section className="department_section"id="Departments">
      <div className="department_container">
        <div className="container">
          <div className="heading_container heading_center">
            <h2>Our Departments</h2>
            <p>
              Asperiores sunt consectetur impedit nulla molestiae delectus
              repellat laborum dolores doloremque accusantium
            </p>
          </div>

          <div className="row">
            {departments.map((dep) => (
              <div className="col" key={dep.id}>
                <div className="box">
                  <div className="img-box">
                    <img src={dep.img} alt={dep.title} />
                  </div>
                  <div className="detail-box">
                    <h5>{dep.title}</h5>
                    <p>{dep.text}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>

          <div className="btn-box">
            <a href="#">View All</a>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Department;
