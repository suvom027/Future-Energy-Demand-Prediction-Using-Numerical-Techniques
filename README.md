# Predicting Future Energy Demand Using Numerical Techniques

This project forecasts Bangladesh’s energy demand up to 2050 using numerical analysis and cubic regression based on GDP per capita. Conducted as part of a lab project, the aim is to support long-term planning for power generation through data-driven forecasting.

---

## Table of Contents

- [Basic Principle of Regression Method](#basic-principle-of-regression-method)  
- [Working Principle](#working-principle)  
- [Why Cubic Regression](#why-cubic-regression)  
- [Results and Analysis](#results-and-analysis)  
- [Source of Error](#source-of-error)  
- [Data Sources](#data-sources)  
- [Conclusion](#conclusion)

---

## Basic Principle of Regression Method

Cubic regression utilizes a third-degree polynomial equation:

**y = a₀ + a₁x + a₂x² + a₃x³**

This method models curvilinear relationships between variables. The coefficients (a₀, a₁, a₂, a₃) are estimated using the **least squares** approach, which minimizes the squared error between predicted and actual values. This allows the model to represent complex trends more accurately than linear or quadratic regression.

### Pros:
- **Captures Complexities:** Suitable for patterns with acceleration or slowdown (e.g., population growth, customer satisfaction changes).
- **Flexibility:** Third-degree polynomial fitting allows better curve shaping than lower-order models.
- **Improved Representation:** Least squares ensures the curve closely follows the underlying data.

### Cons:
- **Over-fitting Risk:** May capture random noise rather than actual trends, affecting performance on new data.
- **Coefficient Interpretation:** As complexity increases, interpreting the meaning of each coefficient becomes more difficult.


## Working Principle

- The code performs cubic regression to predict both GDP per capita and power demand.
- For **GDP prediction**, it uses historical data (`x_gdp`, `y_gdp`) and performs regression to forecast values from 1970 to 2050.
- For **power usage prediction**, a similar method is applied using (`x_power`, `y_power`) for demand estimation.
- The predictions are plotted to show trends in GDP and power demand up to 2050.

---

## Why Cubic Regression

There are three methods of regression considered:

- Linear Regression  
- Parabolic Regression  
- Cubic Regression

<p align="center">
  <table>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/bdad3a51-d479-4572-ad53-234dfb74436e" width="400"><br>
        <b>Fig 1: Parabolic Regression</b>
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/ddcc8f08-5ade-4407-9241-eae907cf70d4" width="700"><br>
        <b>Fig 2: Cubic Regression</b>
      </td>
    </tr>
  </table>
</p>

Among these, **cubic regression** showed the best fit for the dataset:

- Parabolic Regression predicted power demand in 2050 as **39665.63 MW**  
- Cubic Regression predicted **80568.78 MW**  
- IEPMP 2023 projected demand: **84600 MW**

Cubic regression provided results closest to actual projections, making it more suitable for complex, non-linear datasets.

---

## Results and Analysis

<p align="center">
  <img src="https://github.com/user-attachments/assets/1c5d5d5a-2621-403a-a8d2-d602ddb4c749" width="500"><br>
  <b>Fig: Results and Analysis – Predicted vs Projected Data</b>
</p>

<div align="center">

<table>
  <thead>
    <tr>
      <th>Metric</th>
      <th>Predicted (Code)</th>
      <th>Source (Reference)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Power Demand (2050)</td>
      <td>80568.78 MW</td>
      <td>IEPMP: 84600 MW</td>
    </tr>
    <tr>
      <td>GDP per Capita (2050)</td>
      <td>$15177.65</td>
      <td>Statista: $13927.27</td>
    </tr>
  </tbody>
</table>

</div>


Cubic regression closely followed national forecasts, validating its accuracy over simpler models.

---

## Source of Error

### 1. Model Limitations
- Non-linear relationships beyond cubic regression may exist.
- The model doesn't account for energy policy, fuel changes, or technology shifts.
- Key influencing factors like population growth, weather, and policy decisions are not included.

### 2. Data Quality
- Predictions depend on the reliability of historical data.
- Missing or inconsistent data may affect accuracy.

### 3. External Factors
- Economic disruptions, natural disasters, or political shifts can heavily impact both GDP and energy demand.
- Rapid changes in technology (e.g. renewables, efficiency improvements) may invalidate past trends.

---

## Data Sources

- Power demand data from **Bangladesh Power Development Board (BPDB)**  
  [BPDB Report (PDF)](https://bpdb.portal.gov.bd/sites/default/files/files/bpdb.portal.gov.bd/page/771c9a89_a06c_4c2f_9b8c_699d17ed769a/2024-01-03-06-02-dda85c69e3462d6de89b6486edd08779.pdf)

- GDP per capita data from **World Bank**  
  [World Bank Dataset](https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=BD)

- Projected power demand from **Integrated Energy and Power Master Plan (IEPMP) 2023**  
  [IEPMP Report](https://powerdivision.portal.gov.bd/sites/default/files/files/powerdivision.portal.gov.bd/page/4f81bf4d_1180_4c53_b27c_8fa0eb11e2c1/IEPMP%202023.pdf)

---

## Conclusion

This project explored the use of cubic regression to forecast energy demand based on GDP per capita. The model captured the historical trend well and provided predictions closely aligned with national estimates. While there are limitations due to external variables and data quality, cubic regression proved to be an effective tool for long-term energy demand forecasting. Future work can include more influencing factors and adopt advanced modeling techniques to increase accuracy and robustness.

---

