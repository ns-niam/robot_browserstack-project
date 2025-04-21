# Robot Framework Tests on BrowserStack

This repository contains end-to-end UI tests for the [ParaBank](https://parabank.parasoft.com/parabank/index.htm) application using [Robot Framework](https://robotframework.org/) and [BrowserStack](https://www.browserstack.com/). The tests run on multiple browsers (Chrome, Firefox, Safari) via BrowserStack's cloud infrastructure.

## 📁 Project Structure

```
.
├── browserstack_config.py     # Configures BrowserStack remote options
├── requirements.txt           # Dependencies
├── run_tests.py               # Runs tests across multiple browsers
├── test_description.txt       # Description of test cases
├── tests.robot                # Robot Framework test suite
├── .gitignore                 # Git ignored files
└── results/                   # Test logs and reports (auto-generated)
```

## ✅ Test Cases

### 1. Successful Account Login
Verifies that a user can log in with valid credentials.

### 2. Balance Check
Verifies that the account balance is correctly displayed after login.

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 2. Install Dependencies

It is recommended to use a virtual environment.

```bash
python -m venv .venv
.venv\Scripts\activate  # on Windows
pip install -r requirements.txt
```

### 3. Configure BrowserStack Credentials

Edit `browserstack_config.py` and replace with your credentials.

### 4. Run Tests

```bash
python run_tests.py
```

Test results (logs and reports) will be saved in the `results/` directory.

## 🧪 Technologies Used

- Robot Framework
- SeleniumLibrary
- BrowserStack Automate
- Python
