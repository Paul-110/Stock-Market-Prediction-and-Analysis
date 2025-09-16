document.addEventListener('DOMContentLoaded', function() {
    // Initialize all functionality
    initMobileMenu();
    initScrollEffects();
    initFeatureCards();
    initSmoothScrolling();
    initAnimationObserver();
    initNavigation();
    initButtonInteractions();
    initSectionSwitching();
});

// Section switching functionality
function initSectionSwitching() {
    const navLinks = document.querySelectorAll('.nav-link[data-section]');
    const sections = document.querySelectorAll('.content-section, .hero-section, .abstract-section');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetSection = this.getAttribute('data-section');
            
            // Handle special case for home - show hero and features
            if (targetSection === 'home') {
                showHomeSection();
                return;
            }
            
            // Hide all sections except header and footer
            hideAllSections();
            
            // Show target section
            const targetElement = document.getElementById(targetSection);
            if (targetElement) {
                targetElement.classList.remove('hidden');
                targetElement.classList.add('fade-in');
                
                // Scroll to top smoothly
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
                
                // Show appropriate notification
                showSectionNotification(targetSection);
            }
        });
    });
}

function showHomeSection() {
    // Show all home sections
    const heroSection = document.querySelector('.hero-section');
    const featuresSection = document.querySelector('.features-section');
    const abstractSection = document.querySelector('.abstract-section');
    
    // Hide all content sections
    document.querySelectorAll('.content-section').forEach(section => {
        section.classList.add('hidden');
    });
    
    // Show home sections
    if (heroSection) heroSection.classList.remove('hidden');
    if (featuresSection) featuresSection.classList.remove('hidden');
    if (abstractSection) abstractSection.classList.remove('hidden');
    
    // Scroll to top
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

function hideAllSections() {
    // Hide hero, features, and abstract sections
    const heroSection = document.querySelector('.hero-section');
    const featuresSection = document.querySelector('.features-section');
    const abstractSection = document.querySelector('.abstract-section');
    
    if (heroSection) heroSection.classList.add('hidden');
    if (featuresSection) featuresSection.classList.add('hidden');
    if (abstractSection) abstractSection.classList.add('hidden');
    
    // Hide all content sections
    document.querySelectorAll('.content-section').forEach(section => {
        section.classList.add('hidden');
    });
}

function showSectionNotification(section) {
    const messages = {
        'company': 'Loading Company Analysis Dashboard... 🏢',
        'stock': 'Accessing Stock Market Data... 📈',
        'articles': 'Opening Market Articles & Insights... 📰',
        'user': 'Welcome to Your Personal Dashboard... 👤'
    };
    
    const message = messages[section] || `Loading ${section} section...`;
    showNotification(message, 'info');
}

// Mobile Menu Functionality
function initMobileMenu() {
    const mobileToggle = document.querySelector('.mobile-menu-toggle');
    const navigation = document.querySelector('.navigation');
    
    if (mobileToggle && navigation) {
        mobileToggle.addEventListener('click', function() {
            navigation.classList.toggle('mobile-active');
            mobileToggle.classList.toggle('active');
            
            // Animate hamburger menu
            const spans = mobileToggle.querySelectorAll('span');
            spans.forEach((span, index) => {
                if (mobileToggle.classList.contains('active')) {
                    if (index === 0) span.style.transform = 'rotate(45deg) translate(6px, 6px)';
                    if (index === 1) span.style.opacity = '0';
                    if (index === 2) span.style.transform = 'rotate(-45deg) translate(6px, -6px)';
                } else {
                    span.style.transform = '';
                    span.style.opacity = '';
                }
            });
        });
        
        // Close mobile menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!navigation.contains(e.target) && !mobileToggle.contains(e.target)) {
                navigation.classList.remove('mobile-active');
                mobileToggle.classList.remove('active');
                
                const spans = mobileToggle.querySelectorAll('span');
                spans.forEach(span => {
                    span.style.transform = '';
                    span.style.opacity = '';
                });
            }
        });
    }
}

// Enhanced scroll effects for header
function initScrollEffects() {
    const header = document.querySelector('.header');
    let lastScrollY = window.scrollY;
    
    window.addEventListener('scroll', throttle(function() {
        const currentScrollY = window.scrollY;
        
        if (header) {
            if (currentScrollY > 100) {
                header.style.background = 'rgba(44, 62, 80, 0.95)';
                header.style.backdropFilter = 'blur(20px)';
            } else {
                header.style.background = '';
                header.style.backdropFilter = '';
            }
            
            // Hide/show header on scroll
            if (currentScrollY > lastScrollY && currentScrollY > 200) {
                header.style.transform = 'translateY(-100%)';
            } else {
                header.style.transform = 'translateY(0)';
            }
        }
        
        lastScrollY = currentScrollY;
    }, 16));
}

// Feature Cards Interactive Effects
function initFeatureCards() {
    const featureCards = document.querySelectorAll('.feature-card');
    
    featureCards.forEach((card, index) => {
        // Add staggered animation delay
        card.style.animationDelay = `${index * 0.1}s`;
        
        // Enhanced hover effects
        card.addEventListener('mouseenter', function(e) {
            this.style.zIndex = '10';
            
            // Add ripple effect
            createRippleEffect(this, e);
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.zIndex = '';
        });
        
        // Click effect
        card.addEventListener('click', function(e) {
            createClickEffect(this, e);
            
            // Navigate based on card type
            const feature = this.dataset.feature;
            handleFeatureNavigation(feature);
        });
        
        // Add floating animation on hover
        card.addEventListener('mouseenter', function() {
            this.style.animation = 'cardFloat 2s ease-in-out infinite';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.animation = '';
        });
    });
}

// Create ripple effect on card hover
function createRippleEffect(element, event) {
    const ripple = document.createElement('div');
    const rect = element.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height);
    const x = event.clientX - rect.left - size / 2;
    const y = event.clientY - rect.top - size / 2;
    
    ripple.style.cssText = `
        position: absolute;
        width: ${size}px;
        height: ${size}px;
        left: ${x}px;
        top: ${y}px;
        background: radial-gradient(circle, rgba(255,255,255,0.3) 0%, transparent 70%);
        border-radius: 50%;
        transform: scale(0);
        animation: ripple 0.6s ease-out;
        pointer-events: none;
        z-index: 1;
    `;
    
    element.style.position = 'relative';
    element.appendChild(ripple);
    
    setTimeout(() => {
        if (ripple.parentNode) {
            ripple.parentNode.removeChild(ripple);
        }
    }, 600);
}

// Create click effect
function createClickEffect(element, event) {
    const clickEffect = document.createElement('div');
    const rect = element.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;
    
    clickEffect.style.cssText = `
        position: absolute;
        left: ${x}px;
        top: ${y}px;
        width: 40px;
        height: 40px;
        background: rgba(79, 172, 254, 0.6);
        border-radius: 50%;
        transform: scale(0);
        animation: clickPulse 0.4s ease-out;
        pointer-events: none;
        z-index: 10;
    `;
    
    element.appendChild(clickEffect);
    
    setTimeout(() => {
        if (clickEffect.parentNode) {
            clickEffect.parentNode.removeChild(clickEffect);
        }
    }, 400);
}

// Handle feature navigation from cards
function handleFeatureNavigation(feature) {
    // Trigger the same navigation as nav links
    const navLink = document.querySelector(`.nav-link[data-section="${feature}"]`);
    if (navLink) {
        // Update active state
        document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
        navLink.parentElement.classList.add('active');
        
        // Navigate to section
        if (feature === 'home') {
            showHomeSection();
        } else {
            hideAllSections();
            const targetElement = document.getElementById(feature);
            if (targetElement) {
                targetElement.classList.remove('hidden');
                targetElement.classList.add('fade-in');
                window.scrollTo({ top: 0, behavior: 'smooth' });
                showSectionNotification(feature);
            }
        }
    }
}

// Smooth scrolling for anchor links
function initSmoothScrolling() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            // Skip if it has data-section (handled by section switching)
            if (this.hasAttribute('data-section')) return;
            
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement && !targetElement.classList.contains('hidden')) {
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
}

// Intersection Observer for animations
function initAnimationObserver() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
                
                // Add staggered animation for feature cards
                if (entry.target.classList.contains('feature-card')) {
                    const cards = document.querySelectorAll('.feature-card');
                    cards.forEach((card, index) => {
                        setTimeout(() => {
                            card.style.transform = 'translateY(0)';
                            card.style.opacity = '1';
                        }, index * 100);
                    });
                }
            }
        });
    }, observerOptions);
    
    // Observe elements for animation
    const animateElements = document.querySelectorAll('.feature-card, .abstract-content, .hero-content, .content-card');
    animateElements.forEach(el => {
        observer.observe(el);
    });
}

// Enhanced navigation functionality
function initNavigation() {
    const navLinks = document.querySelectorAll('.nav-link');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Remove active class from all nav items
            navLinks.forEach(l => l.parentElement.classList.remove('active'));
            
            // Add active class to clicked item
            this.parentElement.classList.add('active');
            
            // Add click animation
            this.style.transform = 'scale(0.95)';
            setTimeout(() => {
                this.style.transform = '';
            }, 150);
            
            // Close mobile menu if open
            const navigation = document.querySelector('.navigation');
            const mobileToggle = document.querySelector('.mobile-menu-toggle');
            if (navigation && navigation.classList.contains('mobile-active')) {
                navigation.classList.remove('mobile-active');
                mobileToggle.classList.remove('active');
                
                const spans = mobileToggle.querySelectorAll('span');
                spans.forEach(span => {
                    span.style.transform = '';
                    span.style.opacity = '';
                });
            }
        });
        
        // Enhanced hover effect for nav icons
        link.addEventListener('mouseenter', function() {
            const icon = this.querySelector('.nav-icon');
            if (icon) {
                icon.style.transform = 'scale(1.2) rotate(10deg)';
            }
        });
        
        link.addEventListener('mouseleave', function() {
            const icon = this.querySelector('.nav-icon');
            if (icon) {
                icon.style.transform = '';
            }
        });
    });
}

// Button interactions
function initButtonInteractions() {
    const buttons = document.querySelectorAll('.btn');
    
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            // Create click wave effect
            const wave = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            wave.style.cssText = `
                position: absolute;
                width: ${size}px;
                height: ${size}px;
                left: ${x}px;
                top: ${y}px;
                background: rgba(255, 255, 255, 0.5);
                border-radius: 50%;
                transform: scale(0);
                animation: buttonWave 0.5s ease-out;
                pointer-events: none;
            `;
            
            this.style.position = 'relative';
            this.appendChild(wave);
            
            setTimeout(() => {
                if (wave.parentNode) {
                    wave.parentNode.removeChild(wave);
                }
            }, 500);
            
            // Handle button actions
            if (this.textContent.includes('Get Started')) {
                showNotification('Welcome! Let\'s get you started with stock predictions! 🚀', 'success');
            } else if (this.textContent.includes('Learn More')) {
                showNotification('Discover the power of our prediction algorithms! 📊', 'info');
            }
        });
    });
}

// Notification system
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification--${type}`;
    notification.innerHTML = `
        <div style="display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 18px;">${getNotificationIcon(type)}</span>
            <span>${message}</span>
        </div>
    `;
    
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 16px 24px;
        background: ${getNotificationColor(type)};
        color: white;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        z-index: 1000;
        transform: translateX(400px);
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        font-weight: 500;
        max-width: 350px;
        backdrop-filter: blur(10px);
    `;
    
    document.body.appendChild(notification);
    
    // Slide in
    setTimeout(() => {
        notification.style.transform = 'translateX(0)';
    }, 100);
    
    // Slide out and remove
    setTimeout(() => {
        notification.style.transform = 'translateX(400px)';
        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
        }, 300);
    }, 4000);
}

function getNotificationColor(type) {
    const colors = {
        success: 'linear-gradient(135deg, #56ab2f 0%, #a8e6cf 100%)',
        error: 'linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%)',
        warning: 'linear-gradient(135deg, #feca57 0%, #ff9ff3 100%)',
        info: 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)'
    };
    return colors[type] || colors.info;
}

function getNotificationIcon(type) {
    const icons = {
        success: '✅',
        error: '❌',
        warning: '⚠️',
        info: 'ℹ️'
    };
    return icons[type] || icons.info;
}

// Performance optimization: Throttle function
function throttle(func, limit) {
    let inThrottle;
    return function() {
        const args = arguments;
        const context = this;
        if (!inThrottle) {
            func.apply(context, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

// Add CSS animations dynamically
const style = document.createElement('style');
style.textContent = `
    @keyframes ripple {
        from {
            transform: scale(0);
            opacity: 1;
        }
        to {
            transform: scale(1);
            opacity: 0;
        }
    }
    
    @keyframes clickPulse {
        from {
            transform: scale(0);
            opacity: 1;
        }
        to {
            transform: scale(1);
            opacity: 0;
        }
    }
    
    @keyframes buttonWave {
        from {
            transform: scale(0);
            opacity: 0.5;
        }
        to {
            transform: scale(1);
            opacity: 0;
        }
    }
    
    @keyframes cardFloat {
        0%, 100% {
            transform: translateY(-10px) scale(1.02);
        }
        50% {
            transform: translateY(-15px) scale(1.02);
        }
    }
    
    .animate-in {
        animation: fadeInUp 0.6s ease-out forwards;
    }
    
    .feature-card {
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1);
    }
    
    .navigation {
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }
    
    @media (max-width: 768px) {
        .navigation {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: rgba(44, 62, 80, 0.95);
            backdrop-filter: blur(20px);
            padding: 20px;
            transform: translateY(-100%);
            opacity: 0;
            visibility: hidden;
            border-radius: 0 0 12px 12px;
        }
        
        .navigation.mobile-active {
            transform: translateY(0);
            opacity: 1;
            visibility: visible;
        }
        
        .nav-menu {
            flex-direction: column;
            gap: 16px;
        }
        
        .nav-link {
            padding: 16px 20px;
            border-radius: 8px;
            width: 100%;
            justify-content: center;
            background: rgba(255, 255, 255, 0.05);
        }
        
        .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
        }
    }
`;

document.head.appendChild(style);

// Parallax effect for hero section
window.addEventListener('scroll', throttle(function() {
    const scrolled = window.pageYOffset;
    const heroSection = document.querySelector('.hero-section');
    
    if (heroSection && !heroSection.classList.contains('hidden')) {
        const rate = scrolled * -0.3;
        heroSection.style.transform = `translateY(${rate}px)`;
    }
}, 16));

// Add loading state management
window.addEventListener('load', function() {
    document.body.classList.add('loaded');
    
    // Trigger initial animations
    setTimeout(() => {
        const featureCards = document.querySelectorAll('.feature-card');
        featureCards.forEach((card, index) => {
            setTimeout(() => {
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 150);
        });
    }, 500);
});

// Initialize the app by showing home section by default
window.addEventListener('DOMContentLoaded', function() {
    showHomeSection();
});