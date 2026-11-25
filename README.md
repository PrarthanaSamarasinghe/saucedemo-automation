# Sauce Demo – Robot Framework Test Automation

![Robot Framework Tests](https://github.com/PrarthanaSamarasinghe/saucedemo-automation/actions/workflows/tests.yml/badge.svg)

UI and API test automation built with **Robot Framework**:
- **UI tests** for [saucedemo.com](https://www.saucedemo.com) with **SeleniumLibrary** and the **Page Object** pattern
- **API tests** for [JSONPlaceholder](https://jsonplaceholder.typicode.com) (a free practice API) with **RequestsLibrary**

## ✅ What is tested (31 tests)
| Area | Suite | Tests |
|---|---|---|
| Login | `login_tests.robot` | Valid login + negative cases (locked user, wrong password, empty fields) |
| Login (data-driven) | `login_data_driven_tests.robot` | Negative cases using a `Test Template` |
| Shopping cart + checkout | `shopping_tests.robot` | Add / remove products, cart badge, full purchase flow (E2E) with random customer data |
| Burger menu | `menu_tests.robot` | Logout, reset app state |
| Sorting (data-driven) | `sorting_tests.robot` | Name A–Z / Z–A, price low–high / high–low |
| Product details | `product_details_tests.robot` | Correct name and price, back to products, add to cart from details |
| API | `api_tests.robot` | GET (200), GET missing item (404), POST (201) |

## 🛠 Tech stack
- Robot Framework + SeleniumLibrary (UI)
- RequestsLibrary (API)
- Pabot (parallel execution)
- Python helper libraries (random test data, sort checks)
- GitHub Actions (CI: runs on every push and pull request, in headless Chrome)
- Jenkins (pipeline from `Jenkinsfile`: runs after each change on `main` and nightly)

## 📁 Project structure
```
saucedemo-automation/
├── tests/                  # Test suites (.robot)
├── resources/pages/        # Page Objects (UI locators + keywords)
├── resources/api/          # API objects (API keywords)
├── libraries/              # Python helper keywords (DataHelper.py, SortHelper.py)
├── variables/              # config.py (URL, browser, users)
├── .github/workflows/      # GitHub Actions pipeline (tests.yml)
├── Jenkinsfile             # Jenkins pipeline
└── requirements.txt        # Python packages
```

## ▶️ How to run
**1. Install**
```bash
python -m venv .venv
.venv\Scripts\activate          # Windows
python -m pip install -r requirements.txt
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
python -m robot -d results -i smoke tests     # quick smoke tests
python -m robot -d results -i api tests       # API tests only
python -m robot -d results -e api tests       # UI tests only
```

> 💡 By default, the UI tests use a local driver at `drivers/chromedriver.exe`.
> To let Selenium download the driver automatically instead, add `-v CHROMEDRIVER:`

## 📊 Reports
After a run, open `results/report.html` (summary) or `results/log.html` (step-by-step details with screenshots).
- **GitHub Actions:** the files are uploaded as the **robot-results** artifact on each run.
- **Jenkins:** the Robot Framework plugin shows results and trends on the build page.
