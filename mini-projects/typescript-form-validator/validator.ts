type ValidationResult = {
  valid: boolean;
  errors: string[];
};

type RegisterForm = {
  name: string;
  email: string;
  password: string;
};

function validateRegisterForm(form: RegisterForm): ValidationResult {
  const errors: string[] = [];

  if (form.name.trim().length < 3) {
    errors.push("Name must be at least 3 characters.");
  }

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
    errors.push("Email address is invalid.");
  }

  if (form.password.length < 8) {
    errors.push("Password must be at least 8 characters.");
  }

  if (!/[0-9]/.test(form.password)) {
    errors.push("Password must contain at least one number.");
  }

  return {
    valid: errors.length === 0,
    errors,
  };
}

const sample: RegisterForm = {
  name: "Radwan",
  email: "radwan@example.com",
  password: "Code2026",
};

console.log(validateRegisterForm(sample));
