# E-Commerce Customer Segmentation & Personalization (RFM + Clustering)

This project builds an end-to-end customer segmentation solution for a UK-based online retailer using RFM analysis and K-means clustering.

## 1. Project Overview

- **Business problem**: The company wants to understand different customer types to personalize marketing and increase customer lifetime value.
- **Data**: Online Retail II dataset (2009–2010) with invoice-level transactions.
- **Goal**: Create actionable customer segments and export them for use in BI and marketing tools.

## 2. Data & Features

- **Source**: UCI Machine Learning Repository – Online Retail II.
- **Grain**: Each row represents a product line item on an invoice.
- **Key engineered features**:
  - Recency (days since last purchase)
  - Frequency (number of orders)
  - Monetary (total spend, £)
  - ProductDiversity (unique products purchased)
  - AvgOrderValue
  - PurchaseSpan
  - Tenure

## 3. Methodology

1. **Data cleaning**
   - Remove rows without Customer ID.
   - Filter out returns, cancellations, and non-product codes.
   - Drop zero/negative prices and compute line-level revenue.

2. **RFM + behavioral feature engineering**
   - Aggregate transactions to customer level.
   - Compute Recency, Frequency, Monetary and additional features.

3. **RFM scoring**
   - Apply quintile-based scoring to R, F, M.
   - Build a three-digit RFM score.
   - Map to intuitive, rule-based segments.

4. **Clustering**
   - Log-transform and standardize features.
   - Use elbow method + silhouette scores to choose K.
   - Fit K-means and assign cluster labels.
   - Profile clusters to derive human-readable segment names.

5. **Output**
   - Export `data/processed/customer_segments.csv` for BI tools.
   - Build Tableau dashboard for interactive exploration.
,,, text
## 4. Repository Structure

ecommerce-customer-segmentation/
├── data/
│ ├── raw/ # Original dataset (Online Retail II)
│ └── processed/ # Cleaned and enriched outputs (customer_segments.csv)
├── notebooks/
│ └── 01_customer_segmentation_analysis.ipynb
├── src/ # (optional) Python scripts for reusable functions
├── tableau/ # Tableau workbook (.twb/.twbx)
├── reports/ # PDF exports, slides
├── docs/ # Additional documentation
├── requirements.txt
└── README.md
,,,

## 5. How to Run

1. Create and activate a virtual environment:

python3 -m venv venv
source venv/bin/activate

2. Install dependencies:
pip install -r requirements.txt


3. Place the `online_retail_II.xlsx` file in `data/raw/`.

4. Run the notebook:

- Open `notebooks/01_customer_segmentation_analysis.ipynb` in VS Code or Jupyter.
- Execute cells from top to bottom.

5. Open the exported `data/processed/customer_segments.csv` in Tableau and connect it to build the dashboard.

## 6. Tech Stack

- Python (pandas, numpy, scikit-learn, seaborn, matplotlib)
- Tableau for dashboarding
- Virtualenv for environment management

## 7. Author

- Your name (Data Analyst)
- LinkedIn / Portfolio link
