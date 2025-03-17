/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        'cyber-dark': '#0a0a0f',
        'cyber-darker': '#07070c',
        'cyber-light': '#1a1a2f',
        'neon-blue': '#00fff9',
        'neon-pink': '#ff3cd5',
        'neon-purple': '#c238ff',
        'neon-yellow': '#ffef00',
        'neon-red': '#ff1f3d',
      },
      keyframes: {
        glow: {
          '0%': { textShadow: '0 0 5px rgba(0, 255, 249, 0.3), 0 0 10px rgba(0, 255, 249, 0.2)' },
          '100%': { textShadow: '0 0 10px rgba(0, 255, 249, 0.5), 0 0 20px rgba(0, 255, 249, 0.3), 0 0 30px rgba(0, 255, 249, 0.2)' },
        },
        borderGlow: {
          '0%': { boxShadow: '0 0 5px rgba(0, 255, 249, 0)' },
          '100%': { boxShadow: '0 0 15px rgba(0, 255, 249, 0.4)' },
        },
      },
      animation: {
        'glow': 'glow 1.5s ease-in-out infinite alternate',
        'borderGlow': 'borderGlow 2s ease-in-out infinite alternate',
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      boxShadow: {
        'glow': '0 0 15px rgba(0, 255, 249, 0.4)',
      },
    },
  },
  plugins: [],
};