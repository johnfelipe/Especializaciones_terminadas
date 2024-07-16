import React from 'react';
import './testimonials.css';
import TestimonialsCard from '../../components/testimonialsCard/testimonialsCard';
import AlanChen from '../../assets/People/AlanChen.png'
import CaseyLau from '../../assets/People/CaseyLau.png'
import JeanHu from '../../assets/People/JeanHu.png'
import MichealCaldwell from '../../assets/People/MichealCaldwell.png'

export default function Testimonials() {
  return (
    <section className="testimonials">
      <article className="testimonials-topbar">
        <h1>Testimonials</h1>
      </article>
      <section className="testimonials-cards">
        <TestimonialsCard
          image={MichealCaldwell}
          name="Micheal Caldwell"
          description="This is the best Mediterranean food that I've ever had!"
         rating={4}
        />
        <TestimonialsCard
          image={AlanChen}
          name="Alan Chen"
          description="My Shiba Inu, Mugi, really loved the cozy vibes and delicious food here."
          rating={4}
        />
        <TestimonialsCard
          image={CaseyLau}
          name="Casey Lau"
          description="I've had some great Mediterranean food before, but none of them beats Little Lemon in flavor and texture."
          rating={5}
        />
        <TestimonialsCard
          image={JeanHu}
          name="Jean Hu"
          description="Great food, welcoming staff, cozy atmosphere. A great place to treat your kids to."
          rating={3}
        />
      </section>
    </section>
  );
}