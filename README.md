# Sauce Demo – Robot Framework Test Automation

![Robot Framework Tests](https://github.com/PrarthanaSamarasinghe/saucedemo-automation/actions/workflows/tests.yml/badge.svg)

UI test automation for [saucedemo.com](https://www.saucedemo.com), built with **Robot Framework** and **SeleniumLibrary** using the **Page Object** pattern.

## ✅ What is tested
| Area | Tests |
|---|---|
| Login | Valid login + negative cases (locked user, wrong password, empty fields) |
| Login (data-driven) | 6 negative cases using a `Test Template` |
| Shopping cart | Add / remove products, cart badge count |
| Checkout (E2E) | Full purchase flow, including random customer data from a Python helper |

## 🛠 Tech stack
- Robot Framework + SeleniumLibrary
- Pabot (parallel execution)
- Python helper library (random test data)
- GitHub Actions (CI: runs on every push and pull request, in headless Chrome)

## 📁 Project structure
```
saucedemo-automation/
├── tests/                  # Test suites (.robot)
├── resources/pages/        # Page Objects (locators + keywords)
├── libraries/              # Python helper keywords (DataHelper.py)
├── variables/              # config.py (URL, browser, users)
├── .github/workflows/      # CI pipeline (tests.yml)
└── requirements.txt        # Python packages
```

## ▶️ How to run
**1. Install**
```bash
python -m venv .venv
.venv\Scripts\activate          # Windows
pip install -r requirements.txt
```

**2. Run all tests**
```bash
python -m robot -d results tests
```

**3. Run in parallel + headless**
```bash
python -m pabot.pabot --processes 3 -d results -v BROWSER:headlesschrome tests
```

**4. Run by tag**
```bash
python -m robot -d results -i smoke tests
```

> 💡 By default, the tests use a local driver at `drivers/chromedriver.exe`.
> To let Selenium download the driver automatically instead, add `-v CHROMEDRIVER:`

## 📊 Reports
After a run, open `results/report.html` (summary) or `results/log.html` (step-by-step details with screenshots).
In CI, these files are uploaded as the **robot-results** artifact on each GitHub Actions run.