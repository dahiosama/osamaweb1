tailwind.config = {
    darkMode: "class",
    theme: {
        extend: {
            colors: {
                "primary": "#2563ff",
                "background-light": "#f5f6f8",
                "background-dark": "#080c18",
                brand: {
                    navy: '#080c18',
                    electric: '#2563ff',
                    glass: 'rgba(255, 255, 255, 0.03)',
                    'glass-border': 'rgba(255, 255, 255, 0.1)',
                }
            },
            fontFamily: {
                "display": ["Plus Jakarta Sans", "sans-serif"],
                "body": ["Inter", "sans-serif"],
                heading: ['"Space Grotesk"', 'sans-serif']
            },
            borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" },
            boxShadow: {
                'glow': '0 0 20px rgba(37, 99, 255, 0.5)',
                'glow-hover': '0 0 30px rgba(37, 99, 255, 0.8)',
            }
        },
    },
};
