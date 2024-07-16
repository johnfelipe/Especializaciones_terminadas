import Lemon from '../../assets/lemonade.gif';
import './confirmed.css';

export default function Confirmation() {
  return (
    <header className="confirmation-header">
      <img
        className="confirmation-gif"
        src={Lemon}
        alt="Little Lemon Ingredients"
      ></img>
      <section className="reserve-header-text">
        <h1>Reservation Successful!</h1>
        <h4>Your reservation has been successfully confirmed. Thank you for choosing our service. We look forward to serving you.</h4>
      </section>
    </header>
  );
}