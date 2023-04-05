import { render, screen } from '@testing-library/react';
import App from './App';

test('renders Hola JAvi 25 link', () => {
  render(<App />);
  const linkElement = screen.getByText(/Hola JAvi 25/i);
  expect(linkElement).toBeInTheDocument();
});
