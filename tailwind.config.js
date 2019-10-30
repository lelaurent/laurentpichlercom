// Tailwind config file for configuring generated css features. See https://tailwindcss.com/docs
module.exports = {
    theme: {
      extend: {
        spacing: {
          '72': '18rem',
          '80': '20rem',
          '96': '24rem',
        }
      }
    },
    variants: {
      backgroundColor: ['responsive', 'hover', 'focus', 'active']
    },
    plugins: []
  }