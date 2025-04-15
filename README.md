# Financial-App-Database
## 🗄️ How to Load and Use the Database
#### This section outlines the steps to set up, populate, and query the database for this project.

##### Step 1: Initialise the Schema
Run the `InitialiseSchema.sql` to create the database schema and all required tables

##### Step 2: Generate Sample Data
Use the `data_generator.py` Python script to generate sample investor data.
To change the number of investors, modify the `NUM_INVESTORS` variable in `data_generator.py`.

##### Step 3: Populate the Database
After generating the data, populate the database using `python_populate.sql` generated.

#### Context
TotalWealth is a licensed digital investment company that provides a mobile app acting as a digital financial
advisor to help people manage their wealth. The mobile app is the client-facing tool for their proprietary
investment management system called TotalInvest. You have been asked to build the database for
TotalInvest to capture all the data necessary for the operations of the mobile app and TotalInvest.

#### Sample Queries:
1. Find investors who are making on average a loss across all their portfolios in 2024.
2. Find investors who are seeing an annualized return of more than 10% from their portfolios in 2024.
3. Find the monthly average unrealized gain/loss of portfolios for each month in 2024.
4. What is the top three most popular first financial goals for investors in 2024?
5. Find investors who consistently top up their investment at the beginning of every month (dollar-cost
averaging) in 2024 for at least one of their portfolios.
6. Find the most popular financial goals for investors working in the same company and whose age is
between 30 to 40 years old.
7. Are male investors in their 20s making more money from their investments than their female
counterparts in 2024?

#### Database Requirements
1. When an investor signs up, the app requests for the investor’s phone number, date of birth, name, and
gender. The phone number is used as the investor’s login identifier. Subsequent investor information
such as email, annual income, company, etc. will be requested and recorded in TotalInvest’s database
system.
2. The app takes the investor through a questionnaire where five questions are asked. The investor’s risk
tolerance is determined from the answers to the questions. Risk tolerance can be “conservative”,
“moderate”, and “aggressive”. People in the 20s to 30s age group tend to be aggressive and are willing
to take risk. People in the 40s to 50s are generally moderate in their risk tolerance, and those 60s or
higher tend to me more conservative. It is a regulatory requirement that investment platform providers
such as TotalWealth explicitly seeks investor’s risk tolerance before commencing any investment.
3. The app asks the investor to determine one or more financial goals. Examples of financial goals are:
(1) to fund children’s education, (2) to fund holiday vacations, (3) to buy a car, (4) to buy a house, (5)
to generate sufficient monthly cash after retirement, etc. For each goal, the timeline and the amount
of money required to achieve the goal is determined.
4. For each financial goal determined by the investor, TotalInvest generates a portfolio of assets for the
investor and asks the investor how much he/she would like to invest in that portfolio. Assets are
generally a mix of funds, stocks, bonds, commodities, and cash. There are generally less than 10 assets
in a single portfolio, the asset allocation ratio determines how the user’s invested money is be distributed
among the assets. Clearly, the asset allocation ratios for all assets in a portfolio should sum to one (or
100 percent). Generally, an investor may have one or more active portfolios with TotalWealth.
5. Examples of stocks are Apple (AAPL), Microsoft (MSFT), and Tesla (TSLA). Investors use measures
such as price/earnings ratio (P/E ratio), EBITDA, earnings per share (EPS), etc. to evaluate stocks.
Examples of bonds are 10-Year Treasury Note (TMUBMUSD10Y), iShares iBoxx $ High Yield
Corporate (HYG), SPDR Bloomberg Convertible Securities (CWB), etc. Investors use measures such
as interest rate/dividend yields, maturity date, etc. to evaluate bonds. Examples of funds are Vanguard
S&P 500 ETF (VOO), iShares Core MSCI Emerging Markets ETF (IEMG), Schwab US Small-Cap
ETF (SCHA), etc. Investors use measures such as dividend yields, expense ratio, etc. to evaluate funds.
6. Once the investor puts money into a portfolio, TotalInvest operationalizes the portfolio by buying the
required amount of each asset from the market through post-trade companies like Saxo, Clearstream,
Interactive Broker, etc. As there are different assets in a portfolio, more than one post-trade companies
8 of 11
may be used in one portfolio. For each asset in the portfolio, buying the asset from the market is
considered a transaction and is to be recorded with each asset.
7. Once operationalized, the user’s portfolio is now active. It will accrue capital gain or loss regularly over
time. The amount of money invested is the invested value of the portfolio. The latest accrued
unrealised gain/loss of the portfolio together with its invested value is the market value. The user can
use the mobile app to check the performance of the portfolio anytime; whether the portfolio is gaining
or losing money. The gains and losses since the inception of the portfolio is used to compute the
annualized returns of the portfolio, which is a percentage.
8. The user may top up the amount of money invested in a portfolio if he/she thinks the portfolio will
perform in the future. The user may also withdraw any amount of money from the portfolio up to the
market value of the user’s invested sum of money. If it is a full withdrawal, the portfolio will be closed.
Note that the market value may be higher or lower than the amount of money invested. For each asset,
any top up or withdrawal is considered a transaction and is to be recorded with each asset.
9. TotalInvest earns a management fee of 0.88 percent of the user’s invested sum in a portfolio on an
annual basis. TotalInvest will recommend adjustments to the asset allocation ratios on a quarterly
basis to the user. If the user accepts the recommended quarterly re-balancing, the user pays a
transaction fee of 0.20 percent of the user’s invested sum in a portfolio per adjustment. For each asset,
any re-balancing is considered a transaction and is to be recorded with each asset. Both management
and transaction fee may change over time depending on market dynamics.
10. The app has an optional ChatGPT-like mode where users may interact with the app through typed
text or spoken speech, in English, Chinese, Malay, Tamil, and Singlish. Based on users’ input prompts,
the app learns and personalizes future conversations according to users’ preferences. All learned
information is currently stored with ChatGPT and TotalWealth is trying to have the learned
information stored locally within its database system in future.
11. From the information collected of app users, the system applies artificial intelligence/machine learning
(AI/ML) techniques to categorize and predict investor’s behaviour in his/her investment journey via
TotalWealth. AI/ML techniques may be used to provide insights into correlation between user’s age
and the financial goals; between user’s gender/age and patterns of funds top up. All the learned results
will help improve the user interaction with new and existing users.


